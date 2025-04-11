variable "azure_subscription_id" {
  type        = string
  description = "ID da sua assinatura do Azure"
}

variable "azure_resource_group_name" {
  type        = string
  description = "Nome do grupo de recursos do Azure"
  default     = "rg-banco-horas"
}

variable "azure_resource_group_location" {
  type        = string
  description = "Localização do grupo de recursos do Azure"
  default     = "brazilsouth"
}

variable "postgres_server_name" {
  type        = string
  description = "Nome do servidor PostgreSQL flexível do Azure"
  default     = "postgres-banco-horas"
}

variable "postgres_administrator_login" {
  type        = string
  description = "Login do administrador do PostgreSQL"
  default     = "adminuser"
}

variable "postgres_administrator_password" {
  type        = string
  description = "Senha do administrador do PostgreSQL"
  sensitive   = true # Marca como sensível para não ser exibida na saída
}

variable "postgres_sku_name" {
  type        = string
  description = "SKU do servidor PostgreSQL flexível do Azure"
  default     = "Standard_B1ms"
}

variable "postgres_storage_mb" {
  type        = number
  description = "Tamanho do armazenamento do servidor PostgreSQL em MB"
  default     = 5120
}

variable "postgres_version" {
  type        = string
  description = "Versão do PostgreSQL"
  default     = "14"
}

variable "postgres_database_name" {
  type        = string
  description = "Nome do banco de dados PostgreSQL"
  default     = "banco_horas_db"
}

variable "postgres_allow_all_ips_firewall_rule_name" {
  type        = string
  description = "Nome da regra de firewall para permitir todos os IPs (para demonstração)"
  default     = "AllowAllIPs"
}

variable "postgres_db_user_name" {
  type        = string
  description = "Nome do usuário do banco de dados"
  default     = "developer_user"
}

variable "postgres_db_user_password" {
  type        = string
  description = "Senha do usuário do banco de dados"
  sensitive   = true
}

variable "postgres_ssl_mode" {
  type        = string
  description = "Modo SSL para a conexão PostgreSQL"
  default     = "require"
}
