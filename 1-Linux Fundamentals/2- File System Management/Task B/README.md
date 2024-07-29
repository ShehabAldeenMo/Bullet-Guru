# Steps
1. install Gparted
2. Open Gparted
3. Delete previous info of this SD-CARD
4. Click+Right, press new, Resize it, Ok
5. Press Apply
6. Test SD-CARD Patitions
```
lsblk
```
+ Output

```
sda      8:0    0 931.5G  0 disk 
├─sda1   8:1    0   529M  0 part 
├─sda2   8:2    0   100M  0 part /boot/efi
├─sda3   8:3    0    16M  0 part 
├─sda4   8:4    0 199.6G  0 part 
├─sda5   8:5    0   1.1G  0 part 
├─sda6   8:6    0   717M  0 part 
├─sda7   8:7    0 130.9G  0 part 
├─sda8   8:8    0 338.9G  0 part 
└─sda9   8:9    0 259.7G  0 part /var/snap/firefox/common/host-hunspell
                                 /
sdb      8:16   1   7.7G  0 disk 
├─sdb1   8:17   1   3.7G  0 part 
└─sdb2   8:18   1     4G  0 part
```

7. Mount this paritions by define directory and driver
```
cd ~
mkdir P1_Directory
mkdir P2_Directory
sudo mount -t ext3 /dev/sdb1 /P1_Directory
sudo mount -t ext4 /dev/sdb2 /P2_Directory
```

8. Test paritions
```
lsblk
```

+ Output

```
sdb      8:16   1   7.7G  0 disk 
├─sdb1   8:17   1   3.7G  0 part /P1_Directory
└─sdb2   8:18   1     4G  0 part /P2_Directory
```

9. Reboot your PC leads to unmount each parition.
10. `Automatic Mounting`
    
    10.1 Get info about each parition
    ```
    blkid
    ```

    10.2 Open the /etc/fstab file in a text editor with root permissions
    ```
    sudo nano /etc/fstab
    ```

    10.3 Past these two lines based on the mounting points and type.
    ```
    UUID=7beb4328-0eb5-4a7f-8075-56746769f581  /P1_Directory  ext3  defaults  0  2
    UUID=4d8fce70-5de1-4ffe-8c69-214c2b72eb0a  /P2_Directory  ext4  defaults  0  2
    ```

    10.4 Try to connect and disconnect this SD-CARD will lead to unmount them. Try this command to mount
    ```
    sudo mount -a
    ```

> !Note
> If you reboot this PC, Nothing will change.
