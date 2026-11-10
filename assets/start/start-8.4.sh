#!/bin/bash

###---------------------------------###
###    Starting all the services    ###
###---------------------------------###

# Docker VOLUME declarations re-create var/ directories at container start with
# root ownership, discarding whatever the image set at build time.
# Mautic cannot write logs or cache unless www-data owns them, so fix it here.
for d in /var/www/html/var/logs /var/www/html/var/cache /var/www/html/var/tmp \
         /var/www/html/media /var/www/html/media/files /var/www/html/media/images \
         /var/www/html/media/files/form /var/www/html/media/files/temp \
         /var/www/html/config; do
  mkdir -p "$d"
done
chown -R www-data:www-data /var/www/html/var /var/www/html/media /var/www/html/config 2>/dev/null
chmod -R 775 /var/www/html/var /var/www/html/media /var/www/html/config 2>/dev/null

service mariadb start
service php8.4-fpm start
service apache2 start


###----------------------------------###
### Load the Database configuration ###
###----------------------------------###

# We can't send the commands until the DB engine is running
while ! mariadb-admin ping -h localhost --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

# We use the variables previously defined on the Dockerfile:
CREATE_DB_CMD="CREATE DATABASE IF NOT EXISTS \`$MAUTIC_DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
CREATE_USER_CMD="CREATE USER IF NOT EXISTS \`$MAUTIC_DB_USER\`@'%' IDENTIFIED BY '$MAUTIC_DB_PASSWORD';"
GRANT_PRIVILEGES_CMD="GRANT ALL PRIVILEGES ON \`$MAUTIC_DB_NAME\`.* TO \`$MAUTIC_DB_USER\`@'%';"
FLUSH_PRIVILEGES_CMD="FLUSH PRIVILEGES;"

# Execute the SQL commands.
echo "Executing: $CREATE_DB_CMD"
mariadb -u root -e "$CREATE_DB_CMD"
if [ $? -ne 0 ]; then echo "ERROR: Failed to execute CREATE_DB_CMD"; else echo "CREATE_DB_CMD successful."; fi

echo "Executing: $CREATE_USER_CMD"
mariadb -u root -e "$CREATE_USER_CMD"
if [ $? -ne 0 ]; then echo "ERROR: Failed to execute CREATE_USER_CMD"; else echo "CREATE_USER_CMD successful."; fi

echo "Executing: $GRANT_PRIVILEGES_CMD"
mariadb -u root -e "$GRANT_PRIVILEGES_CMD"
if [ $? -ne 0 ]; then echo "ERROR: Failed to execute GRANT_PRIVILEGES_CMD"; else echo "GRANT_PRIVILEGES_CMD successful."; fi

echo "Executing: $FLUSH_PRIVILEGES_CMD"
mariadb -u root -e "$FLUSH_PRIVILEGES_CMD"
if [ $? -ne 0 ]; then echo "ERROR: Failed to execute FLUSH_PRIVILEGES_CMD"; else echo "FLUSH_PRIVILEGES_CMD successful."; fi

cd /

# Only import on first boot. The dump begins with DROP TABLE / CREATE TABLE for
# every table, so re-running it on each start would wipe the data volume.
if mariadb -u root -e "USE \`$MAUTIC_DB_NAME\`; SELECT 1 FROM users LIMIT 1;" >/dev/null 2>&1; then
    echo "Database already initialised - skipping import."
else
    echo "Attempting to import database from /mauticdb-dump.sql..."
    if [ -f "/mauticdb-dump.sql" ] && [ -r "/mauticdb-dump.sql" ]; then
        echo "SQL dump file /mauticdb-dump.sql found and is readable."
        # Connect as root via the unix socket (no password needed for root@localhost).
        mariadb -u root "$MAUTIC_DB_NAME" < /mauticdb-dump.sql
        MARIADB_IMPORT_EXIT_CODE=$?
        if [ $MARIADB_IMPORT_EXIT_CODE -eq 0 ]; then
            echo "Database import completed successfully."
        else
            echo "ERROR: Database import failed with exit code $MARIADB_IMPORT_EXIT_CODE."
        fi
    else
        echo "ERROR: SQL dump file /mauticdb-dump.sql not found or not readable."
    fi
fi

###----------------------------------###
###    Keep the container running    ###
###----------------------------------###

# Keep the container running forever and ever and ever...
tail -f /dev/null
