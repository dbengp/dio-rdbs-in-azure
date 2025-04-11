resource "azurerm_resource_group" "rg" {
  name     = var.azure_resource_group_name
  location = var.azure_resource_group_location
}

resource "azurerm_postgresql_flexible_server" "postgres_server" {
  name                   = var.postgres_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  administrator_login    = var.postgres_administrator_login
  administrator_password = var.postgres_administrator_password
  sku_name               = var.postgres_sku_name
  storage_mb             = var.postgres_storage_mb
  version                = var.postgres_version

  depends_on = [azurerm_postgresql_flexible_database.banco_horas_db]
}

resource "azurerm_postgresql_flexible_database" "banco_horas_db" {
  name      = var.postgres_database_name
  server_id = azurerm_postgresql_flexible_server.postgres_server.id
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name                = var.postgres_allow_all_ips_firewall_rule_name
  server_id           = azurerm_postgresql_flexible_server.postgres_server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
  depends_on = [azurerm_postgresql_flexible_server.postgres_server]
}

resource "postgresql_database" "banco_horas_db_resource" {
  name        = var.postgres_database_name
  owner       = var.postgres_administrator_login
  depends_on  = [azurerm_postgresql_flexible_database.banco_horas_db]
}

resource "postgresql_role" "db_user" {
  name     = var.postgres_db_user_name
  password = var.postgres_db_user_password
  login    = true
  depends_on = [postgresql_database.banco_horas_db_resource]
}

resource "postgresql_default_privileges" "db_user_privileges" {
  role        = postgresql_role.db_user.name
  owner       = var.postgres_administrator_login
  database    = postgresql_database.banco_horas_db_resource.name
  object_type = "table"
  privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
  depends_on  = [postgresql_role.db_user]
}

resource "postgresql_query" "create_banco_horas_table" {
  database = postgresql_database.banco_horas_db_resource.name
  sql      = <<SQL
CREATE TABLE IF NOT EXISTS banco_horas (
    id SERIAL PRIMARY KEY,
    id_desenvolvedor INTEGER NOT NULL,
    data_registro DATE NOT NULL,
    hora_inicio TIME WITHOUT TIME ZONE NOT NULL,
    hora_fim TIME WITHOUT TIME ZONE NOT NULL,
    horas_trabalhadas NUMERIC NOT NULL,
    justificativa TEXT
);
SQL
  depends_on = [postgresql_database.banco_horas_db_resource]
}
