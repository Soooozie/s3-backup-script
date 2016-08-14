# s3-backup-script

This is a simple backup script for automating website backups using s3 to cloud storage. 
At the top of this script you will see another script is called (vars.sh). 
This is a separate bash script where I defined a few of the variables (DOCROOT, DATABASE_NAME, and BUCKET_NAME) and exported them.
You can create your own variable script to set these variables to whatever you need or you can directly change these in the backup script.

Ex: export VAR="123"

I also set up a .my.cnf file to allow the script to run without having to enter username/password for the mysqldump. 
You will also need to have s3 installed and set up. 

This script will take your docroot and database dump and upload them to your cloud storage bucket using S3cmd. 

That's it folks!! 


