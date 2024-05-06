#!/usr/bin/env bash
#
########################################################################################
#
# Script para realização de backups.
#
# Script principal para realizar backups com base nas configurações do arquivo 
# backup_config.sh.
#
#########################################################################################

# Importa as configurações do arquivo de configuração
source backup_conf.sh

# Current date and time
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Username running the script
username=$(whoami)

# Functions

# Function to check if the script is being executed as root
root_only(){
  if [ "$USER" != "root" ]; then
    echo "Você não tem permissão para executar este arquivo! \nEntre em contato com o administrador."
    exit 1
  fi
}

# Function to create the backup
create_backup(){
  # Check if the backup folder exists; if not, create it with root-exclusive permissions
    if [ ! -d "$backup_folder" ]; then
    sudo mkdir -p "$backup_folder"
    sudo chown root:root "$backup_folder"
    sudo chmod 700 "$backup_folder"
  fi

  # Create the backup file, redirecting output to /dev/null (to discard) and errors to the log file.
  tar -czvf "$backup_folder/$backup_file_name" "$source_directory" >> /dev/null 2>>$log_file

  # Check if the backup was created successfully and log the outcome.
  if [ $? -eq 0 ]; then
    echo "$current_date - Backup of all directories in $source_directory was successfully created in $backup_folder/$backup_file_name by user $username" >> "$log_file"
  else
    echo "$current_date - An error occurred while creating the backup of all directories in $source_directory by user $username. Check $log_file for details." >> "$log_file"
  fi
}

# Function to send the backup via email
send_email(){
    # Send the backup file via email
    mail -s "Backup of directory $source_directory" $email < "$backup_folder/$backup_file_name"
  
    echo "$current_date - Backup sent via email to seu_email." >> "$log_file"
}

# Uncomment the next line to enable checking if the script is being executed as root
#root_only

# Perform the backup
create_backup

# Uncomment the next line to enable sending the backup via email
#send_email
