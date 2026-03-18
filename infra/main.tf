module "resource_group" {
  source       = "./modules/resource_group"
  project_name = var.project_name
  location     = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  vnet_address_space = var.vnet_address_space
  subnet_web         = var.subnet_web
  subnet_app         = var.subnet_app
  subnet_db          = var.subnet_db
  subnet_mgmt        = var.subnet_mgmt
}
module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  subnet_web_id  = module.network.subnet_web_id
  subnet_app_id  = module.network.subnet_app_id
  subnet_db_id   = module.network.subnet_db_id
  subnet_mgmt_id = module.network.subnet_mgmt_id

  admin_ip = "38.248.95.36/32"
}
module "jumpbox" {
  source              = "./modules/jumpbox"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  subnet_mgmt_id = module.network.subnet_mgmt_id

  admin_username = var.admin_username
  admin_ssh_key  = var.admin_ssh_key
}
module "web_tier" {
  source              = "./modules/web_tier"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  subnet_web_id = module.network.subnet_web_id

  admin_username = var.admin_username
  admin_ssh_key  = var.admin_ssh_key
}