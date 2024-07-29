**Exercise 1: Basic Navigation**
+ Use ls to list all files and directories in the current directory.
```
ls
```

+ Use cd to navigate to a specific directory.
```
cd
```

+ Use pwd to print the current working directory.
```
pwd
```

**Exercise 2: File and Directory Operations**
+ Create a directory named "practice" in the current directory using mkdir.
```
mkdir practice
```

+ Create an empty file named "file.txt" within the "practice" directory using touch.
```
touch file.txt
vim file.txt
```
then press i and write what you want.

+ Copy "file.txt" to a new file "file_backup.txt" using cp.
```
cp file.txt file_backup.txt
```

+ Move "file_backup.txt" to another directory using mv.
```
mv file_back.txt "/home/shehab/Desktop/Embedded Linux Track"
```

+ Rename "file.txt" to "new_file.txt" using mv.
```
mv file.txt mew_file.txt
```

+ Delete the "new_file.txt" using rm.
```
rm -r new_file.txt
```

**Exercise 3: File Viewing and Editing**
+ Create a text file using echo or a text editor like nano.
```
echo Shehab > file.txt
```

+ View the contents of the file using cat. View the contents of the file using less.
```
cat file.txt
cat file.txt | less
```

+ Edit the file using nano or another text editor.
```
vim file.txt
```

+ Redirect the output of a command (e.g., ls) to a file using >.
```
ls > file.txt
```

**Exercise 4: File Permissions**
+ Create a file and set specific permissions using chmod.
```
chmod g-w file.txt
```
 
+ Check the permissions of the file using ls -l.
```
ls -l
```

+ Change the owner and group of the file using chown.
```
chown shehab file.txt
sudo groupadd developers
chown :developers file.txt
```

+ Verify the changes using ls -l.
```
ls -l
```

**Exercise 5: User and Group Management**
+ Create a new user using useradd.
```
sudo useradd master-x
```

+ Set a password for the new user using passwd.
```
sudeo passwd master-x
```

+ Create a new group using groupadd.
```
sudo groupadd developers
```

+ Add the user to the newly created group using usermod.
```
sudo usermod -aG developers master-x
```

**Exercise 6: Process Management**
+ List all processes using ps.
```
ps -aux
```

+ List processes in real-time using top.
```
top
```
  
+ Find a specific process using pgrep.
```
pgrep chrome
```
  
+ Terminate a process using kill.
```
kill -9 processid
```

**Exercise 7: File Searching**
+ To find a file named example.txt in the current directory and its subdirectories:
```
find . -name "example.txt"
```

+ To find a directory named myfolder.
```
find / -type d -name "myfolder"
```

+ Use grep to search for a specific string in a file.
cat file.txt | grep "Shehab Mohamed"


**Exercise 8: Archiving and Compression**
+ Create a tar archive of a directory using tar.
```
tar -cvf archive.tar practice
```

+ Compress the tar archive using gzip.
```
gzip archive.tar
```

+ Extract the tar archive using tar.
```
tar -xvf archive.tar.gz
```

**Exercise 9: Networking**
+ Ping a website or IP address using ping.
```
ping www.google.com
```



