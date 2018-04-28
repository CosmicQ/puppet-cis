class cis::setup::set_1_5 (

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

    $kernel_parameters.each |String $k_param, String $val| {
      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        noop    => $run,
      }
    }

    package { 'prelink':
      ensure => purged,
    }
  }
}