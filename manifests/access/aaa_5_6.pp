# Ensure access to the 'su' command is restricted
class cis::access::aaa_5_6 (

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

# grep pam_wheel.so /etc/pam.d/su
#auth required pam_wheel.so use_uid

#  }
}