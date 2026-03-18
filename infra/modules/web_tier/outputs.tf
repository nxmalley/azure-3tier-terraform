output "web_private_ip" {
  value = azurerm_network_interface.web_nic.private_ip_address
}