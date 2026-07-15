#!/bin/bash

target_Dir="$1"
backup_Dir="$2"
create_dir=0
time=$(date +'_%Y-%m-%d_%H-%M-%S')
archiveName=""


logFunction(){
	local check_success="$1"
	local cause="$2" 
	echo "==================================================================" >> "BackupLogFile.txt"
	if [ $check_success -eq 1 ]; then
		echo "Time        : $(echo "$time" | sed 's/_/ /g')" >> "BackupLogFile.txt"
		echo "Source      : $target_Dir" >> "BackupLogFile.txt"
		echo "Destination : $(realpath "$backup_Dir")" >> "BackupLogFile.txt"
		echo "Archive     : $archiveName" >> "BackupLogFile.txt"	
		echo "Status      : Success" >> "BackupLogFile.txt"
	elif [  $check_success -eq 0 ]; then
		echo "Time        : $(echo "$time" | sed 's/_/ /g')" >> "BackupLogFile.txt"
		echo "Status      : Failed" >> "BackupLogFile.txt"
		echo "Reason      : $cause" >>  "BackupLogFile.txt"
    	fi
	echo "==================================================================" >>  "BackupLogFile.txt"
}

if   [ -z "$target_Dir" ]; then
	echo "No Target Directory was provided : provide a valid target directory"
	logFunction 0 "No Target Directory was provided : provide a valid target directory"
else
	if [ -d "$target_Dir" ]; then

		if [ ! -d "$backup_Dir" ]; then
			echo "Backup Directory doesn't exist : specify where you need to backup your files"
			echo "Do you want to create new backup directory ? (Y/N) "
			read create_dir 
			if [ "$create_dir" = "Y" ]; then
				if [ -z "$backup_Dir" ]; then
					backup_Dir="./Backup"
					if [ ! -d "./Backup" ]; then
						mkdir "./Backup" 
						if [ $? -ne 0 ]; then
							logFunction 0 "mkdir command Failed : Backup Folder Creation Failed"
							exit 1
						fi
						echo "New Directory at $backup_Dir was successfully created"
					fi
				else
					mkdir "$backup_Dir"
					if [ $? -ne 0 ]; then
						logFunction 0 "mkdir command Failed : Backup Folder Creation Failed"
						exit 1
					fi
					echo "New Directory at $backup_Dir was successfully created"
				fi
			else 
				echo "Enter A Valid Backup Directory then try again"
				echo "Backup Cancelled"
				logFunction 0 "Backup Directory doesn't exist : specify where you need to backup your files"
				exit 1
			fi	
		fi
			archiveName=$(basename "$target_Dir")		
			archiveName=$(echo "$archiveName$time.tar" | sed 's/ /-/g')
			tar -cvf "$archiveName" "$target_Dir" --force-local
			if [ $? -ne 0 ];  then
				logFunction 0 "tar command Failed : backup didn't complete successfully"
				exit 1
			fi 
			 mv -v "$archiveName" "$backup_Dir"
			if [ $? -ne 0 ]; then
				logFunction 0 "mv command Failed : backup didn't complete successfully"
				exit 1
			fi
			logFunction 1 
	else
		echo "Target Directory doesn't exist : check for typo or try another directory"
		logFunction 0 "Target Directory doesn't exist : check for typo or try another directory"
	fi
fi


