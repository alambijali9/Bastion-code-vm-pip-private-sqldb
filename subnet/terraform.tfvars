snet = {


  snet1 = {


    name                 = "frontend_subnet"
    rg_name              = "private"
    virtual_network_name = "VnetA"
    address_prefixes     = ["10.0.1.0/24"]

  }


  snet2 = {


    name                 = "backend_subnet"
    rg_name              = "private"
    virtual_network_name = "VnetA"
    address_prefixes     = ["10.0.2.0/24"]

  }

  


}