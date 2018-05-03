# System File Permissions
class cis::linux::system::sys_6_1 (

  String $status,

){

  $check = $status ? {
    'enable' => true,
    'notify' => true,
    default  => false,
  }

  $run = $status ? {
    'enable' => false,
    default  => true,
  }

  #if $check {

    # 6.1.2
    # chown root:root /etc/passwd
    # chmod 644 /etc/passwd

    # 6.1.3
    # chown root:root /etc/shadow
    # chmod 000 /etc/shadow

    # 6.1.4
    # chown root:root /etc/group
    # chmod 644 /etc/group

    # 6.1.5
    # chown root:root /etc/gshadow
    # chmod 000 /etc/gshadow

    # 6.1.6
    # chown root:root /etc/passwd-
    # chmod 600 /etc/passwd-

    # 6.1.7
    # chown root:root /etc/shadow-
    # chmod 600 /etc/shadow-

    # 6.1.8
    # chown root:root /etc/group-
    # chmod 600 /etc/group-

    # 6.1.9
    # chown root:root /etc/gshadow-
    # chmod 600 /etc/gshadow-

    # 6.1.10 No world writable files
    # 6.1.11 No unowned files or directories
    # 6.1.12 No ungrouped files or directories
    # 6.1.13 Audit SUID executables 
    # 6.1.14 Audit SGID executables

  #}
}