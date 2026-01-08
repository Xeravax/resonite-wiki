#!/bin/sh

DATE=`date +%Y-%m-%d_%H-%M-%S`
tar -czvf /files-backups/Images-$DATE.tar.gz /images

echo "[$(date)] Starting R2 sync"

rclone sync /database-backups r2:${R2_BUCKET_NAME}/database-backups \
  --transfers 4 \
  --checkers 8 \
  --log-level INFO

rclone sync /files-backups r2:${R2_BUCKET_NAME}/files-backups \
  --transfers 4 \
  --checkers 8 \
  --log-level INFO

echo "[$(date)] R2 sync completed"