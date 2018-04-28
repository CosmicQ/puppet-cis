class cis::services::srv_2_3 (

  String $status            = 'disable',
  Array $service_clients,

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

  if $check {
    # 3.1.1
    $service_clients.each |String $service_client| {
      package { "${service_client}":
        ensure  => purged,
        noop    => $run,
      }
    }
  }
