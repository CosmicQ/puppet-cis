# Configure PAM
class cis::access::aaa_5_3 (

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