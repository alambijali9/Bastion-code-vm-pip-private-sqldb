data "azurerm_subnet" "Subnet_ID" {
  for_each = var.Virtual_machine
  name                 = each.value.Subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name

}



data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault" "keyvault" {
  name                = "alamkeyvault1234"
  resource_group_name = "private"
}
