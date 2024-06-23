#!/bin/bash

# Ensure the database directory exists
mkdir -p /app/Backend/database

# Create the SQLite database file
touch /app/Backend/database/database.sqlite

# Set the correct permissions for the SQLite database
chmod 777 /app/Backend/database/database.sqlite

# Debugging: Print the contents of the .env file
echo "Contents of .env file:"
cat /app/Backend/.env

# Debugging: Print the Laravel database configuration
php artisan config:clear
php artisan config:cache
php artisan config:show | grep DB_

# Debugging: List contents of the database directory
echo "Contents of /app/Backend/database before migration:"
ls -la /app/Backend/database

# Run Laravel migrations
php artisan migrate --force

# Debugging: List contents of the database directory again to confirm the database file is created
echo "Contents of /app/Backend/database after migration:"
ls -la /app/Backend/database

# Start the Laravel server
php artisan serve --host=0.0.0.0 --port=8000
