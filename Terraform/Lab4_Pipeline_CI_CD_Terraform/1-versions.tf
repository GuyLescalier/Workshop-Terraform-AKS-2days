#   _______                   __                                           _                                              _     _               
#  |__   __|                 / _|                                         (_)               ___                          (_)   | |              
#     | | ___ _ __ _ __ __ _| |_ ___  _ __ _ __ ___    __   _____ _ __ ___ _  ___  _ __    ( _ )     _ __  _ __ _____   ___  __| | ___ _ __ ___ 
#     | |/ _ \ '__| '__/ _` |  _/ _ \| '__| '_ ` _ \   \ \ / / _ \ '__/ __| |/ _ \| '_ \   / _ \/\  | '_ \| '__/ _ \ \ / / |/ _` |/ _ \ '__/ __|
#     | |  __/ |  | | | (_| | || (_) | |  | | | | | |   \ V /  __/ |  \__ \ | (_) | | | | | (_>  <  | |_) | | | (_) \ V /| | (_| |  __/ |  \__ \
#     |_|\___|_|  |_|  \__,_|_| \___/|_|  |_| |_| |_|    \_/ \___|_|  |___/_|\___/|_| |_|  \___/\/  | .__/|_|  \___/ \_/ |_|\__,_|\___|_|  |___/
#                                                                                                   | |                                         
#                                                                                                   |_|                                         

terraform {
  required_version = ">= 1.1.7"
  # cf. https://www.terraform.io/language/settings/backends/azurerm
  backend "azurerm" {
    resource_group_name  = "RG-AKSCluster"         # mettre ici le nom du resource group de vos ressource
    storage_account_name = "terraformglr"      # mettre le nom du compte de stockage créer dans le lab 1
    container_name       = "tfstate"
    key                  = "pipeline-gh.terraform.tfstate" 
    # pour les options d'authentification au backend Azure Storage cf. https://www.terraform.io/language/settings/backends/azurerm
    # sas_token = "sp=racwl&st=2022-10-24T14:11:44Z&se=2022-10-25T22:11:44Z&spr=https&sv=2021-06-08&sr=c&sig=DBo0urLsgkaazicWGsdcVNjpdMU8sWrLdvQdGY3ObJI%3D"
  }
  
  required_providers {
    azurerm = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
      # Configure the Azure Provider
      # more info : https://github.com/terraform-providers/terraform-provider-azurerm
      # Check Changelog : https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
      source  = "hashicorp/azurerm"
      version = "= 2.98.0"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
  subscription_id = var.AzureSubscriptionID
  client_id       = var.AzureClientID
  client_secret   = var.AzureClientSecret
  tenant_id       = var.AzureTenandID
}
