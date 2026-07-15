# Automatic Backup Tool

## Overview

Automatic Backup Tool is a Bash scripting project that automates the process of creating backup archives for directories. Given a source directory and a backup destination, the script validates the user input, creates a timestamped archive of the target directory, stores it in the specified backup location, and records the result of the operation in a log file. The project was developed to demonstrate practical Bash scripting techniques while building a reliable command-line utility that simplifies routine backup tasks.

Data loss is one of the most common problems computer users encounter. Important files may be accidentally deleted, corrupted, modified unintentionally, or become inaccessible due to hardware failures or malicious software. Maintaining regular backups is one of the simplest and most effective ways to protect valuable data and ensure that previous versions can be recovered whenever needed. Automating this process reduces the possibility of human error while saving time and effort.

The script accepts both absolute and relative directory paths as input. Before creating a backup, it verifies that the target directory exists and checks whether the specified backup directory is available. If the backup directory does not exist, the user is given the option to create it automatically. Once validation is complete, the target directory is archived, renamed using the current date and time to generate a unique filename, and moved to the backup directory. Every backup operation, whether successful or unsuccessful, is recorded in a log file together with the timestamp, source directory, destination directory, archive name, operation status, and, when applicable, the reason for failure.

The project was designed with simplicity, reliability, maintainability, and extensibility in mind. It correctly handles directory names containing spaces, supports both relative and absolute paths, validates user input before performing operations, records detailed logs for easier troubleshooting, and organizes its logic into reusable Bash functions to improve readability and simplify future enhancements.

## Features

- Creates timestamped backup archives of target directories.
- Stores backup archives in a user-specified destination.
- Automatically creates the backup directory (with user confirmation) if it does not exist.
- Accepts both absolute and relative directory paths.
- Validates user input before performing backup operations.
- Records successful and failed backup operations in a detailed log file.
- Preserves directory and file names containing spaces.
- Returns meaningful error messages when an operation fails.
- Uses reusable Bash functions for improved readability and maintainability.

## Requirements

To run this project, you need:

- **Operating System:** Linux, macOS, or Windows (using Git Bash or WSL)
- **Bash:** Version 4.3 or later
- **GNU Core Utilities:** Includes commands such as `mkdir`, `mv`, `basename`, `date`, and `realpath`
- **tar:** Required for creating archive files
- **Git:** Required only for cloning the repository

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/MostafaSayedAhmed/Automatic-Backup-Tool.git
cd Automatic-Backup-Tool
chmod +x backupTool.sh
```

## Usage

Run the following command to create a backup of a directory:

```bash
./backupTool.sh "target_directory" "backup_directory"
```

Where:

- `target_directory` is the directory you want to back up.
- `backup_directory` is the destination where the backup archive will be stored.
  _Note : don't miss putting your directory between quotes to ensure perfect operation_

## Example

### Input

Suppose the following directory structure exists:

```text
Home
├── Projects
│   ├── Project1
│   ├── Project2
│   └── Notes.txt
└── Backups
```

Run the following command:

```bash
./backupTool.sh "~/Projects" "~/Backups"
```

_Note : don't miss putting your directory between quotes to ensure perfect operation_

### Result

After execution, the backup directory will contain a timestamped archive of the target directory:

```text
Backups
└── Projects_2026-07-16_14-30-45.tar
```

The operation will also be recorded in `BackupLogFile.txt`:

```text
==================================================================
Time        : 2026-07-16 14-30-45
Source      : /home/user/Projects
Destination : /home/user/Backups
Archive     : Projects_2026-07-16_14-30-45.tar
Status      : Success
==================================================================
```

## Example 2 – Backup Directory Does Not Exist

### Command

```bash
./backupTool.sh ~/Projects ~/Backups
```

### Output

```text
Backup Directory doesn't exist.
Do you want to create a new backup directory? (Y/N)
Y

New Directory at ~/Backups was successfully created.
```

The backup archive is then created successfully and the operation is logged.

## Project Goal

This project aims to automate the process of creating backup archives for directories using Bash scripting. Given a target directory and a backup destination, the script validates the user input, creates a timestamped archive of the target directory, stores it in the specified backup location, and records the result of the operation in a log file.

The goal of the project is to demonstrate practical Bash scripting concepts while building a reliable command-line utility that reduces manual work and helps protect important data from accidental loss or corruption.

## Input

The project accepts two command-line arguments:

- **Target Directory:** The directory to be archived and backed up.
- **Backup Directory:** The destination where the backup archive will be stored.

Both arguments may be provided as either absolute or relative paths.
_Note : don't miss putting your directory between quotes to ensure perfect operation_

## Output

After successful execution, the project produces:

- A timestamped archive (`.tar`) of the target directory stored in the specified backup location.
- A log entry in `BackupLogFile.txt` containing:
  - Timestamp of the operation
  - Source directory
  - Backup destination
  - Archive name
  - Operation status (Success or Failed)
  - Failure reason, when applicable

The script also provides informative messages during execution to notify the user of the progress and any errors encountered.

## Rules

The script follows the rules below while creating backups:

- The target directory must exist before the backup operation begins.
- The backup destination may be specified using either an absolute or relative path.
- If the backup directory does not exist, the user is given the option to create it automatically.
- Backup archives are named using the target directory name followed by a timestamp to prevent filename collisions.
- Directory and file names containing spaces are handled correctly.
- Every backup operation is recorded in a log file.
- The script terminates immediately if a critical operation fails.

## Edge Cases

The project handles several common edge cases:

- No target directory is provided.
- The target directory does not exist.
- The backup directory does not exist.
- The user declines creating the backup directory.
- Failure while creating the backup directory.
- Failure while creating the archive.
- Failure while moving the archive to the backup directory.
- Directory names containing spaces.
- Both absolute and relative paths are accepted.

## Known Limitations

The current version of the project has the following limitations:

- Backups are stored as uncompressed `.tar` archives.
- Existing backup archives with identical names are not overwritten because each archive includes a timestamp.
- Backup verification (verifying archive integrity after creation) is not implemented.
- Automatic deletion of old backups is not implemented.
- Scheduled backups using `cron` are not implemented.
- The project has been developed and tested using Bash 4.3 or later.

## Future Improvements

Possible enhancements for future releases include:

- Support compressed archives (`.tar.gz`).
- Automatically remove backup archives older than a configurable number of days.
- Schedule automatic backups using `cron`.
- Support backup verification after archive creation.
- Add command-line options (e.g., force overwrite, silent mode, custom archive format).
- Allow users to customize the log file location.
- Support excluding specific files or directories from the backup.

## Project Structure

```text
Automatic-Backup-Tool/
│
├── backupTool.sh         # Main Bash script
├── README.md             # Project documentation
└── BackupLogFile.txt     # Generated log file after execution
```

The project is intentionally kept simple. All backup logic is implemented within a single Bash script using reusable functions for logging and input validation. The script emphasizes readability, maintainability, and proper error handling while demonstrating practical use of common Linux command-line utilities.

## Commands Used and their functions
[Project Link]([https://github.com/MostafaSayedAhmed/Automatic-Backup-Tool](https://roadmap.sh/projects/log-archive-tool))
[Markdown Syntax Reference](https://markdownlivepreview.com/)
