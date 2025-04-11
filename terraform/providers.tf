terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.18"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

provider "postgresql" {
  host            = azurerm_postgresql_flexible_server.postgres_server.fqdn
  port            = 5432
  username        = azurerm_postgresql_flexible_server.postgres_server.administrator_login
  password        = azurerm_postgresql_flexible_server.postgres_server.administrator_password
  database        = azurerm_postgresql_flexible_database.banco_horas_db.name
  sslmode         = var.postgres_ssl_mode
  connect_timeout = 5
}
