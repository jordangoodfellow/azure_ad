# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.102.0" # Specify the desired version
    }
 aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
      region = "us-east-2"
    } 
  
  }

  backend "s3" {
    bucket         	   = "goodfellow-tech-dev"
    key              	   = "backend.tfstate"
    region         	   = "us-east-2"
    encrypt        	   = true
    dynamodb_table = "tf-backend"
  }
}

# Provides configfuration details for Azure Terraform provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "test-1"
  location = "East Us"
  tags = {
    environment = "dev"
  }
}
###Test
###Test2