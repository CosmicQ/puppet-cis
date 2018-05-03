# Ensure root login is restrictred to system console
class cis::linux::access::aaa_5_5 (

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

    # 5.5 - 
# cat /etc/securetty
#Remediation:
#Remove entries for any consoles that are not in a physically secure location

#  }
}