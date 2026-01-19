terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "web" {
  source = "../../modules/web_app"

  name             = "cheap-demo"
  location         = "westeurope"
  rg_name          = "rg-cheap-demo"
  sku              = "B1"
  instance_count   = 1
  enable_insights  = false
  enable_storage  = false
}
