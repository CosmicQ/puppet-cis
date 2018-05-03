# User and Group Settings
class cis::linux::system::sys_6_2 (

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

#  if $check {

    # 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd
    # 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow
    # 6.2.4 Ensure no legacy "+" entries exist in /etc/group
    # 6.2.5 Ensure root is the only UID 0 account
    # 6.2.6 Ensure root PATH Integrity
    # 6.2.7 Ensure all users home directories exist
    # 6.2.8 Ensure users home directories permissions are 750 or more restrictive
    # 6.2.9 Ensure users own their home directories
    # 6.2.10 Ensure users dot files are not group or world writable
    # 6.2.11 Ensure no users have .forward files
    # 6.2.12 Ensure no users have .netrc files
    # 6.2.13 Ensure users .netrc Files are not group or world accessible 
    # 6.2.14 Ensure no users have .rhosts files
    # 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group
    # 6.2.16 Ensure no duplicate UIDs exist
    # 6.2.17 Ensure no duplicate GIDs exist
    # 6.2.18 Ensure no duplicate user names exist
    # 6.2.19 Ensure no duplicate group names exist

#  }
}