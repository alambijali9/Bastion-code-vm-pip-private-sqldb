resource "azurerm_network_interface" "NIC" {
  for_each            = var.Virtual_machine
  name                = each.value.name_nic
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.Subnet_ID[each.key].id
    private_ip_address_allocation = "Dynamic"


  }
}

resource "azurerm_linux_virtual_machine" "VM" {
  for_each            = var.Virtual_machine
  name                = each.value.name_vm
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  # admin_username      = each.value.admin_username
  # admin_password      = each.value.admin_password
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.NIC[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "30"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# output "op_pip" {

#   value = azurerm_linux_virtual_machine.VM.public_ip_address
# }
