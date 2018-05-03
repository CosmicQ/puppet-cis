# Additional Process Hardening
class cis::linux::setup::set_1_5 (

  String $status,
  Hash   $kernel_parameters

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

    # 1.5.1 - Ensure core dumps are restricted
    # 1.5.3 - Ensure address space layout randomization
    $kernel_parameters.each |String $k_param, String $val| {
      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        noop    => $run,
      }
    }

    # 1.5.4 - Ensure prelink is disabled
    package { 'prelink':
      ensure => purged,
    }
    
  }
}