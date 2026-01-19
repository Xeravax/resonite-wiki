#!/bin/sh

# Wait for database to be ready
echo "[$(date)] Waiting for database connection..."
until mysql -h resonite-wiki-database -u root -p"$(cat /run/secrets/mysql_root_password)" -e "SELECT 1" wiki_db 2>/dev/null >/dev/null; do
  echo "[$(date)] Database not ready, waiting..."
  sleep 2
done
echo "[$(date)] Database connection established"

# Check if database is seeded
if mysql -h resonite-wiki-database -u root -p"$(cat /run/secrets/mysql_root_password)" -e "SELECT 1 FROM user LIMIT 1" wiki_db 2>/dev/null >/dev/null; then
  echo "[$(date)] Database already seeded, skipping restore"
  exit 0
fi

# Rclone connection string
RCLONE_REMOTE=":s3,provider=Cloudflare,endpoint='${R2_ENDPOINT}',access_key_id='${R2_ACCESS_KEY_ID}',secret_access_key='${R2_SECRET_ACCESS_KEY}':${R2_BACKUP_BUCKET_NAME}"

LATEST_FILE=$(rclone ls "${RCLONE_REMOTE}/database-backups/latest/" | awk '{print $2}')

if [ -n "$LATEST_FILE" ]; then
  echo "[$(date)] Restoring database from $LATEST_FILE"
  rclone cat "${RCLONE_REMOTE}/database-backups/latest/$LATEST_FILE" | gunzip | mysql -h resonite-wiki-database -u root -p"$(cat /run/secrets/mysql_root_password)" wiki_db
  echo "[$(date)] Database restore completed"
else
  echo "[$(date)] No latest backup found"
fi
