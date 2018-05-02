# Service Clients
class cis::services::srv_2_3 (

  String $status,
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
    # 2.3.1-5
    $service_clients.each |String $service_client| {
      package { "${service_client}":
        ensure  => purged,
        noop    => $run,
      }
    }
  }
}