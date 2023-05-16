#!/bin/bash

#jalankan crontab
#crontab -e

#30 00 * * *  . ./home/postgres/backup.sh

USER="root"
DATABASE="nama_db"
HOST="localhost"
BACKUP_DIRECTORY="/home/postgres"

# Date stamp (formated YYYYMMDD)
# just used in file name
CURRENT_DATE=$(date "+%Y%m%d")

# Database named (command line argument) use pg_dump for targed backup
docker exec -it db_master pg_dump -U $USER $DATABASE -h $HOST | gzip - > $BACKUP_DIRECTORY/$DATABASE\_$CURRENT_DATE.sql.gz