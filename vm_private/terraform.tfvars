Virtual_machine = {

  VM1 = {

 
    name_nic          = "Networkcard"
    name_vm           = "frontendVM"
    Subnet_name       = "frontend_subnet"
    vnet_name          ="VnetA"
    size              = "Standard_F2"
    rg_name           = "private"
    location          = "West Europe"
    allocation_method = "Static"
    admin_username    = "adminuser"
    admin_password    = "1y^lqs0L5c6C"

  }


  VM2 = {


    name_nic          = "Networkcard2"
    name_vm           = "backendVM"
    Subnet_name       = "backend_subnet"
    vnet_name          ="VnetA"
    size              = "Standard_F2"
    rg_name           = "private"
    location          = "West Europe"
    allocation_method = "Static"
    admin_username    = "adminuser"
    admin_password    = "1y^lqs0L5c6C"


  }




}