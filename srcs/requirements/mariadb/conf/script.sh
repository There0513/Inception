#!/bin/bash

# configure database

if [ ! -d "var/lib/mysql/"$MYSQL_DATABASE ]; then
echo 'no wordpress -> install mysql:'

mysql_install_db;

echo "start mysql:"
service mysql start
echo "mysql started"

mysql <<-EOF
ALTER USER \`root\`@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
GRANT ALL PRIVILEGES ON *.* TO \`root\`@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD <<-EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
EOF


mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

fi

exec "$@"