  case $::operatingsystemmajrelease {
    6: {
      file {'/etc/grub.conf':
        owner => root,
        group => root,
        mode  => '0600',
      }
    }
    7: {
      file {'/boot/grub2/grub.cfg':
        owner => root,
        group => root,
        mode  => '0600',
      }
    }
    default: {}
  }



## Setting below is needed for CIS compliance
GRUB_CMDLINE_LINUX_DEFAULT="audit=1 selinux=1 enforcing=1"

# init
BOOTUP=color
GRAPHICAL=yes
RES_COL=60
MOVE_TO_COL="echo -en \\033[${RES_COL}G"
SETCOLOR_SUCCESS="echo -en \\033[0;32m"
SETCOLOR_FAILURE="echo -en \\033[0;31m"
SETCOLOR_WARNING="echo -en \\033[0;33m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"
LOGLEVEL=3
PROMPT=no
SINGLE=/sbin/sulogin
AUTOSWAP=no
UMASK=027