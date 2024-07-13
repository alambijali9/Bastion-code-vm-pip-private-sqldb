bastion = {

  bast1 = {

    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "private"
    virtual_network_name = "VnetA"
    address_prefixes     = ["10.0.3.0/24"]
    basipname            = "baspublicip"
    location             = "West Europe"
    allocation_method    = "Static"
    sku                  = "Standard"
    hostname             = "bastionhost"



  }



}
