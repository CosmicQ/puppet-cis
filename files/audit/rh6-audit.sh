#!/bin/bash
#
# This script is just to perform a simple CIS audit of the system
# to verify that the puppet module is working.

#RES_COL=$COLUMNS-10
RES_COL=120
MOVE_TO_COL="echo -en \\033[${RES_COL}G"
SETCOLOR_SUCCESS="echo -en \\033[1;32m"
SETCOLOR_FAILURE="echo -en \\033[1;31m"
SETCOLOR_WARNING="echo -en \\033[1;33m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"

function success {
    $MOVE_TO_COL
    echo -n "["
    $SETCOLOR_SUCCESS
    echo -n $"  OK  "
    $SETCOLOR_NORMAL
    echo -n "]"
    echo -ne "\r"
}

function failure {
    $MOVE_TO_COL
    echo -n "["
    $SETCOLOR_FAILURE
    echo -n $"FAILED"
    $SETCOLOR_NORMAL
    echo -n "]"
    echo -ne "\r"
}

function skip {
    $MOVE_TO_COL
    echo -n "["
    echo -n $" SKIP "
    echo -n "]"
    echo -ne "\r"
}

# Param 1 = exit status.  Param 2 = What exit status SHOULD be.
function check {
  if [ $1 -eq $2 ]; then
          success
  else
          failure
  fi
  echo
}

echo "1 Initial Setup"
echo "1.1 Filesystem Configuration"
echo "1.1.1 Disable unused filesystems"
echo -n "1.1.1.1 Ensure mounting of cramfs filesystems is disabled"
modprobe -n -v cramfs | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.2 Ensure mounting of freevxfs filesystems is disabled"
modprobe -n -v freevxfs | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.3 Ensure mounting of jffs2 filesystems is disabled"
modprobe -n -v jffs2 | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.4 Ensure mounting of hfs filesystems is disabled"
modprobe -n -v hfs | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.5 Ensure mounting of hfsplus filesystems is disabled"
modprobe -n -v hfsplus | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.6 Ensure mounting of squashfs filesystems is disabled"
modprobe -n -v squashfs | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.7 Ensure mounting of udf filesystems is disabled"
modprobe -n -v udf | grep -q -s install /bin/true
check $? 1 

echo -n "1.1.1.8 Ensure mounting of FAT filesystems is disabled"
modprobe -n -v vfat | grep -q -s install /bin/true
check $? 1 

skip
echo "1.1.2 Ensure separate partition exists for /tmp"

echo -n "1.1.3 Ensure nodev option set on /tmp partition"
mount | grep /tmp | grep -q -s nodev
check $? 1

echo -n "1.1.4 Ensure nosuid option set on /tmp partition"
mount | grep /tmp | grep -q -s nosuid
check $? 1

echo -n "1.1.5 Ensure noexec option set on /tmp partition"
mount | grep /tmp | grep -q -s noexec
check $? 1

skip
echo "1.1.6 Ensure separate partition exists for /var"

skip
echo "1.1.7 Ensure separate partition exists for /var/tmp"

echo -n "1.1.8 Ensure nodev option set on /var/tmp partition"
mount | grep /var/tmp | grep -q -s nodev
check $? 1

echo -n "1.1.9 Ensure nosuid option set on /var/tmp partition"
mount | grep /var/tmp | grep -q -s nosuid
check $? 1

echo -n "1.1.10 Ensure noexec option set on /var/tmp partition"
mount | grep /var/tmp | grep -q -s noexec
check $? 1

skip
echo "1.1.11 Ensure separate partition exists for /var/log"

skip
echo "1.1.12 Ensure separate partition exists for /var/log/audit"

skip
echo "1.1.13 Ensure separate partition exists for /home"

echo -n "1.1.14 Ensure nodev option set on /home partition"
mount | grep /home | grep -q -s nodev
check $? 1

echo -n "1.1.15 Ensure nodev option set on /dev/shm partition"
mount | grep /dev/shm | grep -q -s nodev
check $? 0

echo -n "1.1.16 Ensure nosuid option set on /dev/shm partition"
mount | grep /dev/shm | grep -q -s nosuid
check $? 0

echo -n "1.1.17 Ensure noexec option set on /dev/shm partition"
mount | grep /dev/shm | grep -q -s noexec
check $? 0

skip
echo "1.1.18 Ensure nodev option set on removable media partitions"

skip
echo "1.1.19 Ensure nosuid option set on removable media partitions"

skip
echo "1.1.20 Ensure noexec option set on removable media partitions"

echo -n "1.1.21 Ensure sticky bit is set on all world-writable directories"
WWD=`find \`df --local -P | awk 'NR!=1 { print $6 }' | xargs\` -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print | wc -l`
check $WWD 0

echo -n "1.1.22 Disable Automounting"
chkconfig --list |grep autofs|grep -q -s on
check $? 1

