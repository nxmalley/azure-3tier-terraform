variable "project_name" {
  description = "Name of the project and resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_web" {
  description = "CIDR block for the web tier subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_app" {
  description = "CIDR block for the application tier subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_db" {
  description = "CIDR block for the database tier subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "subnet_mgmt" {
  description = "CIDR block for the management (jump box) subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "admin_username" {
  description = "Admin username for virtual machines"
  type        = string
}

variable "admin_ssh_key" {
  description = "SSH public key for VM authentication"
  type        = string
}