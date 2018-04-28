class cis::services::srv_2_1 (

  String $status            = 'disable',
  Array $xinetd_services,

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
    $xinetd_services.each |String $xinetd_service| {
      service { "${xinetd_service}":
        ensure  => stopped,
        enable  => false,
        noop    => $run,
      }
    }
  }
