#!/usr/bin/env bash
#
########################################################################################
#
# Configuração para o script de backup (backup_execution.sh).
#
# Configuração de variáveis, funções e outras configurações específicas.
#
#########################################################################################

# Log file to store backup operation details
log_file="/var/log/backup.log"

# Email address to send the backup file (if desired)
email="meuemail@email.com"

# Directory to be backed up
source_directory="/home"

# Destination directory for storing backups
backup_folder="/bck"

# Date and time stamp format options:
#date_time=$(date +"%Y%m%d%H%M%S")      # Example: backup_home_YYMMDDHHMMSS
#date_time=$(date +"%d%m%Y")            # Example: backup_home_DDMMYY.tar.gz
date_time=$(date +"%d_%m_%Y")           # Example: backup_home_DD_MM_YY.tar.gz
