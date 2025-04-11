# dio-rdbs-in-azure
## Demonstração de implantação de Banco de Dados Relacional na Azure: implantação de um Banco de Dados PostgreSQL flexível para cálculo de banco de horas.

### Bancos de Dados Relacionais na Nuvem: Fundamentais para Aplicações Modernas
  - Os bancos de dados relacionais hospedados na nuvem oferecem uma base robusta e escalável para o armazenamento e gerenciamento de dados estruturados. Eles fornecem integridade de dados, consistência e recursos avançados de consulta, sendo essenciais para muitas aplicações empresariais e sistemas de software. Ao utilizar um provedor de nuvem como o Azure, as empresas podem se beneficiar da alta disponibilidade, escalabilidade automática e segurança gerenciada, sem a complexidade da administração de infraestrutura física.

### Benefícios dos Bancos de Dados Relacionais na Nuvem (Azure Database for PostgreSQL como exemplo):
  - **Escalabilidade:** Aumente ou diminua os recursos de computação e armazenamento conforme a demanda da sua aplicação, com opções de escalabilidade vertical e horizontal.
  - **Alta Disponibilidade:** O Azure oferece opções de alta disponibilidade e recuperação de desastres para garantir a continuidade dos seus serviços.
  - **Segurança:** Recursos avançados de segurança, incluindo criptografia de dados em repouso e em trânsito, firewalls e proteção contra ameaças.
  - **Gerenciamento Simplificado:** O Azure cuida das tarefas de manutenção, como backups, patches e atualizações, permitindo que você se concentre no desenvolvimento da sua aplicação.
  - **Flexibilidade:** Escolha entre diferentes opções de implantação (Servidor Único, Servidor Flexível, Hiperescala) para atender aos seus requisitos específicos de desempenho e custo.

### Caso de Uso: Base de Banco de Horas para Desenvolvedores de Sistemas
  - Este exemplo demonstra a criação de um banco de dados relacional PostgreSQL no Azure para gerenciar o banco de horas de desenvolvedores de sistemas. A estrutura da tabela `banco_horas` incluirá as seguintes colunas para representar o contexto:
    - `id`: Identificador único para cada registro de banco de horas (Chave Primária).
    - `id_desenvolvedor`: Identificador do desenvolvedor associado ao registro.
    - `data_registro`: Data em que as horas foram trabalhadas.
    - `hora_inicio`: Horário de início do trabalho.
    - `hora_fim`: Horário de término do trabalho.
    - `horas_trabalhadas`: Total de horas trabalhadas no período.
    - `justificativa`: Descrição ou motivo para as horas trabalhadas (opcional).

### Considerações Importantes para Implantação de Banco de Dados Relacional na Azure:
  - **Opção de Implantação:** Escolha a opção de implantação do Azure Database for PostgreSQL (Servidor Único ou Servidor Flexível) que melhor se adapta às suas necessidades de escalabilidade, disponibilidade e custo. O Servidor Flexível oferece maior controle e opções de configuração.
  - **Configuração do Servidor:** Defina o nome do servidor, localização, versão do PostgreSQL, credenciais de administrador e tamanho da computação e armazenamento.
  - **Regras de Firewall:** Configure as regras de firewall para permitir o acesso ao banco de dados a partir dos seus recursos (sua máquina local para testes, servidores de aplicação, etc.).
  - **Segurança:** Implemente políticas de segurança robustas, incluindo senhas fortes, criptografia e acesso limitado.
  - **Backup e Restauração:** Configure políticas de backup automático e familiarize-se com o processo de restauração em caso de necessidade.

### Pré-requisitos para o Exemplo Aqui Usado:
  - Uma conta do Azure com uma assinatura ativa.
  - Terraform instalado em sua máquina local.
  - Azure CLI instalado e configurado (para autenticação).

### Para implantar essa infraestrutura usando o Terraform com CLI é bem simples (por garantia, esteja no mesmo diretório que o arquivo main.tf se encontra). Execute:
  - <h3>terraform init</h3> para inicializar o Terraform e baixar os provedores.
  - <h3>terraform plan</h3> para visualizar as alterações que serão feitas.
  - <h3>terraform apply</h3> para criar os recursos no Azure.
