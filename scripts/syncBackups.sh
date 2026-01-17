#!/bin/sh

echo "[$(date)] Starting R2 sync"

rclone sync /database-backups r2:${R2_BACKUP_BUCKET_NAME}/database-backups \
  --transfers 4 \
  --checkers 8 \
  --log-level INFO

echo "[$(date)] R2 sync completed"
