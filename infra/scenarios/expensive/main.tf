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

  name             = "expensive-demo"
  location         = "westeurope"
  rg_name          = "rg-expensive-demo"
  sku              = "P2v3"
  instance_count   = 2
  enable_insights  = true
  enable_storage  = true
}
