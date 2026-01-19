output "app_name" {
  value = azurerm_linux_web_app.this.name
}

output "plan_sku" {
  value = azurerm_service_plan.this.sku_name
}
