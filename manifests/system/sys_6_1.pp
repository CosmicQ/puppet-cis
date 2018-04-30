# System File Permissions
class cis::system::sys_6_1 (

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