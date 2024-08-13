# File Organizer Script

## Overview

The **File Organizer** is a simple Bash script designed to organize files within a specified directory based on their file types. The script automatically sorts files into subdirectories based on their extensions, helping to keep directories clean and organized.

## Features

- **Directory Organization**: Automatically creates subdirectories for different file types.
- **File Categorization**: Moves files into appropriate subdirectories based on their extensions.
- **Miscellaneous Handling**: Files with unknown or no extensions are moved into a `misc` subdirectory.
- **Edge Cases**: The script handles files with no extensions, hidden files (starting with a dot), and existing subdirectories.

## Prerequisites

- A Unix-like operating system with Bash shell.
- Basic knowledge of command-line usage.

## Usage

### 1. Clone the Repository

```
git clone https://github.com/your-username/file-organizer.git
cd file-organizer
```
### 2. Make the Script Executable 
```
chmod +x organize_files.sh
```

### 3. Run the Script
```
./organize_files.sh /path/to/directory
```

Replace `/path/to/directory` with the actual path to the directory you want to organize.

### 4. Example
```
Downloads/
|-- file1.txt
|-- file2.jpg
|-- file3.pdf
|-- file5_without_extension
|-- file6.unknown
```

### 5. After running the script:
```
./organize_files.sh ~/Downloads
```

**The `Downloads` directory will be reorganized as follows:**

```
Downloads/
|-- txt/
|   |-- file1.txt
|-- jpg/
|   |-- file2.jpg
|-- pdf/
|   |-- file3.pdf
|-- misc/
    |-- file5_without_extension
    |-- file6.unknown
```


