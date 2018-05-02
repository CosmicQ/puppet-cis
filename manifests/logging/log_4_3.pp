# Ensure logrotate is configured
class cis::loging::log_4_3 (

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



#  }
}