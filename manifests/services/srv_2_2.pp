class cis::services::srv_2_2 (

  String $status,
  Array $special_services,

){
	
  $check = $status ? {
    'enable'  => true,
    'notify'  => true,
    default   => false,
  }

  $run = $status ? {
    'enable'  => false,
    default   => true,
  }

# NTP is handeled via puppet/ntp

  if $check {
    $special_services.each |String $special_service| {
      service { "${special_service}":
        ensure  => stopped,
        enable  => false,
        noop    => $run,
      }
    }
  }
}