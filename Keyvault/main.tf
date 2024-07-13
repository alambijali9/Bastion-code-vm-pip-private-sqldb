data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "keyvault" {
  for_each = var.key
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      
    ]

    secret_permissions = [
  
    ]

    storage_permissions = [
    
    ]
  }
}

# resource "azurerm_key_vault_secret" "username" {
#   name         = "username"
#   value        = "adminuser"
#   key_vault_id = "/subscriptions/306c88ff-e60a-4228-8a2e-cd36bcb9f0ed/resourceGroups/private/providers/Microsoft.KeyVault/vaults/alamkeyvault1234"
# }
# resource "azurerm_key_vault_secret" "password" {
#   name         = "password"
#   value        = "1y^lqs0L5c6C"
#   key_vault_id = "/subscriptions/306c88ff-e60a-4228-8a2e-cd36bcb9f0ed/resourceGroups/private/providers/Microsoft.KeyVault/vaults/alamkeyvault1234"
# }