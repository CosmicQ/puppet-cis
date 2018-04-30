# User and Group Settings
class cis::system::sys_6_2 (

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

  if $check {



  }
}