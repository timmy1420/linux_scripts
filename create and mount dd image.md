Download image filesystem using `dd` command:
```
ssh root@172.16.77.10 "sudo /bin/dd if=/dev/sda" | dd of=edp.dd
```
After this, we can now mount the image using the following below:
____

You can mount a disk image created with the `dd` tool in Linux, even if it contains an XFS filesystem. To do this, you'll need to use a loop device to treat the image file as if it were an actual disk device. Here are the steps to mount a dd image file with an XFS filesystem:

1. Check if the loop module is loaded:
   ```
   lsmod | grep loop
   ```

   If the loop module is not loaded, you can load it with the following command:
   ```
   sudo modprobe loop
   ```

2. Mount the image using a loop device:

   Replace `/path/to/your/image.dd` with the actual path to your dd image file and `/mnt/mountpoint` with the directory where you want to mount the XFS filesystem. 

   ```
   sudo losetup -fP /path/to/your/image.dd
   ```

   This command associates the image file with an available loop device. The `-P` option is used to create partitions on the loop device if the image contains partitions.

3. Check the loop devices and partitions:
   ```
   sudo losetup -a
   ```

   This command will show you the loop devices and their associated image files.

4. Mount the XFS partition:

   You'll need to determine the correct partition number within the loop device. This can be done using the `partx` or `gdisk` commands:

   For `partx`:
   ```
   sudo partx -a /dev/loopX
   ```

   Replace `/dev/loopX` with the loop device you associated with your image.

   For `gdisk` (if you know the partition layout):
   ```
   sudo gdisk /dev/loopX
   ```

   Once you have the correct partition information, you can mount it like this:

   ```
   sudo mount /dev/loopXpY /mnt/mountpoint
   ```

   Replace `/dev/loopXpY` with the correct partition identifier and `/mnt/mountpoint` with your desired mount point.

5. You can now access the contents of the XFS filesystem at the specified mount point.

6. To unmount the image when you're done, use the following command:
   ```
   sudo umount /mnt/mountpoint
   ```

7. To release the loop device:
   ```
   sudo losetup -d /dev/loopX
   ```

Replace `/dev/loopX` with the loop device you associated with your image.

Remember to use `sudo` for these commands if you are not the superuser, as mounting and unmounting require root privileges.