

resource "azurerm_mssql_server" "sqlserver"{
    for_each = var.sql
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     =each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}

resource "azurerm_mssql_database" "db" {
for_each = var.sql
  name           = each.value.db_name
  server_id      = azurerm_mssql_server.sqlserver[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "Basic"
  zone_redundant = false
  enclave_type   = "VBS"

}