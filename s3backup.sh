#!/bin/sh

source ./vars.sh

#backup docroot
BACKUP_FILES=$DOCROOT

#make temp directory
TEMP_DIR=$(mktemp -d)

#where to put backup
DEST=$TEMP_DIR

#create archive filename
ARCHIVE_FILE="backup.tgz"

#backup files using tar
tar -czf $DEST/$ARCHIVE_FILE $BACKUP_FILES

#mysql backups
NOW=$(date +%s)
FILENAME="db_backup"
BACKUP_FOLDER="$DEST"
FULLPATHBACKUPFILE="$BACKUP_FOLDER/$FILENAME"

#the dump
mysqldump $DATABASE_NAME | gzip > $BACKUP_FOLDER/$FILENAME.sql.gz

#combining the two zipped files
cd $DEST
tar -cf backup_complete_$NOW.tar $ARCHIVE_FILE $FILENAME.sql.gz

#delete other files
rm $DEST/$ARCHIVE_FILE
rm $DEST/$FILENAME.sql.gz

#Upload your stuff to your storage
cd ~
s3cmd put $DEST/backup_complete_$NOW.tar $BUCKET_NAME

#delete all the messiness on your server
rm -r $DEST

#That's it folks!
