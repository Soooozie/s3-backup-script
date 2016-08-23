# s3-backup-script

This is a simple backup script for automating website backups using s3 to cloud storage. 
At the top of this script you will see another script is called (vars.sh). 
This is a separate bash script where I defined a few of the variables (DOCROOT, DB_CONFIG, WEB_SERVER_CONFIG, DATABASE_NAME, and BUCKET_NAME) and exported them.
You can create your own variable script to set these variables to whatever you need or you can directly change these in the backup script.

Ex: 
#!/bin/bash
export DOCROOT="/path/to/docroot"
export DB_CONFIG=("/etc/my.cnf" "/path/to/your/database/config") 
export WEB_SERVER_CONFIG=("/path/to/your/webserver/config" "/etc/httpd/example") 
export BUCKET_NAME="s3://your_bucket_name_here"
export DATABASE_NAME="your_database_name_here"

In the s3-backup-script, I used an array to include all files (if you choose to add multiple directories to one variable as shown in DB_CONFIG and WEB_SERVER_CONFIG above) in the tar process. 

I also set up a .my.cnf file to allow the script to run without having to enter username/password for the mysqldump. 
You will also need to have s3 installed and set up. 

This script will take your docroot and database dump and upload them to your cloud storage bucket using S3cmd. 

That's it folks!! 


