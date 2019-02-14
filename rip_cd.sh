#First parameter - path to iso file with its name. Remember to add .iso extension

blockSize=$(isoinfo -d -i /dev/cdrom | grep -i -E "block size is: [0-9]+" | tee /dev/tty | sed -n -e '/block size is:/ s/.*\: *//p')
volumeSize=$(isoinfo -d -i /dev/cdrom | grep -i -E "Volume size is: [0-9]+" | tee /dev/tty | sed -n -e '/Volume size is:/ s/.*\: *//p')

dd if=/dev/cdrom of=$1 bs=$blockSize count=$volumeSize

eject

