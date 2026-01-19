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

mmodule "web" {
  source = "../../modules/web_app"

  name            = "autoscale-demo"
  location        = "westeurope"
  rg_name         = "rg-autoscale-demo"
  sku             = "P1v3"
  instance_count  = 1

  enable_insights = true
  enable_storage = true

  enable_autoscale = true
  autoscale_min    = 1
  autoscale_max    = 3
}
