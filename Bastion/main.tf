
resource "azurerm_subnet" "bas_subnet" {
  for_each = var.bastion
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "bas_ip" {
   for_each = var.bastion
  name                = each.value.basipname
  location            = each.value.location
  resource_group_name =  each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "bas_host" {
   for_each = var.bastion
  name                = each.value.hostname
  location            =  each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration1"
    subnet_id            = data.azurerm_subnet.Subnet_ID[each.key].id
    public_ip_address_id = azurerm_public_ip.bas_ip[each.key].id
  }
}