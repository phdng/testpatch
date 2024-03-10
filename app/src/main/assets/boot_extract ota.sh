#!/system/bin/sh

#only flash to ota should check boot 
ARCH=$(getprop ro.product.cpu.abi)

# Load utility functions
. ./util_functions.sh

mount_partitions

[ -z $SLOT ] && { >&2 echo "- can't determined current boot slot!"; exit 1; }

exchange_boot_slot

find_boot_image

[ -e "$BOOTIMAGE" ] || { >&2 echo "- can't find boot.img!"; exit 1; }

true
