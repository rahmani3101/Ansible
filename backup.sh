#!/bin/bash
set -euo pipefail

# Comprehensive Backup Script for Servers

# Configuration
BACKUP_DIR="/var/backups/servers"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="/var/log/server_backup.log"
RETENTION_DAYS=30

# Logging function
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

# Backup database
backup_database() {
    local db_name="$1"
    local backup_file="${BACKUP_DIR}/${db_name}_${TIMESTAMP}.sql.gz"
    
    log_message "Backing up database: ${db_name}"
    pg_dump -U postgres "${db_name}" | gzip > "${backup_file}"
}

# Backup file system
backup_filesystem() {
    local source_dir="$1"
    local backup_name=$(basename "${source_dir}")
    local backup_file="${BACKUP_DIR}/${backup_name}_${TIMESTAMP}.tar.gz"
    
    log_message "Backing up filesystem: ${source_dir}"
    tar -czf "${backup_file}" "${source_dir}"
}

# Remove old backups
cleanup_old_backups() {
    log_message "Cleaning up backups older than ${RETENTION_DAYS} days"
    find "${BACKUP_DIR}" -type f -mtime +${RETENTION_DAYS} -delete
}

# Main backup function
perform_backup() {
    # Ensure backup directory exists
    mkdir -p "${BACKUP_DIR}"

    # Backup databases
    backup_database "myapp_production"
    backup_database "monitoring"

    # Backup important directories
    backup_filesystem "/etc/nginx"
    backup_filesystem "/var/www/html"
    backup_filesystem "/etc/postgresql"

    # Cleanup old backups
    cleanup_old_backups

    log_message "Backup process completed successfully"
}

# Execute backup
perform_backup
