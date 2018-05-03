# Special Purpose Services
class cis::linux::services::srv_2_2 (

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

  # 2.2.2 - Ensure X Window System is not installed
  # This is more of an audit point, than configuration management.
  # Just make sure you install the minimal OS.

  if $check {

    # 2.2.3-14, 2.2.16-21
    $special_services.each |String $special_service| {
      service { "${special_service}":
        ensure  => stopped,
        enable  => false,
        noop    => $run,
      }
    }

    # 2.2.15 - Ensure mail transfer agent is configured for local-only mode
    # /etc/postfix/main.cf
    # inet_interfaces = localhost

  }
  
}