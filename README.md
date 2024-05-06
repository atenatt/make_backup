# Script de Backup em Bash

Este é um conjunto de scripts em Bash para realizar backups de diretórios específicos em um sistema Linux. Ele permite configurar o backup de um diretório específico, armazenar os backups em uma pasta designada e opcionalmente enviar os backups por e-mail.

## Configuração

Antes de executar os scripts, certifique-se de configurar corretamente as variáveis no arquivo `backup_config.sh`:

- `log_file`: Caminho para o arquivo de log onde os detalhes das operações de backup serão registrados.
- `email`: Endereço de e-mail para enviar o arquivo de backup (opcional).
- `source_directory`: Diretório a ser copiado para o backup.
- `backup_folder`: Diretório de destino para armazenar os backups.
- `date_time`: Formato do carimbo de data e hora a ser usado no nome do arquivo de backup.

## Execução

Para executar o script de backup, basta executar o arquivo `backup_execution.sh`:

```bash
./backup_execution.sh

# Funcionalidades

- **Verificação de Root**: O script verifica se está sendo executado como root antes de realizar o backup para garantir permissões adequadas.
- **Envio por E-mail**: Se configurado, o script pode enviar o arquivo de backup por e-mail.

# Cron Job (Agendamento)

Se desejar agendar backups regularmente, você pode configurar um job no cron para executar o script de backup em intervalos definidos. Para fazer isso, adicione uma entrada no crontab:

```bash
0 2 * * * /caminho/para/backup_execution.sh
