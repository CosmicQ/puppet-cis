class cis::network::net_3_3 (

  String $status = 'disable'
  Hash   $kernel_parameters

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
    # 3.3.1
    $kernel_parameters.each |String $k_param, String $val| {
      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        comment => 'Setting managed by Puppet',
        noop    => $run,
      }
    }

    # 3.3.3
    file_line { '(3.3.3) - Ensure IPv6 is disabled (Not Scored)':
      ensure => present,
      path   => '/etc/modprobe.d/CIS.conf',
      line   => 'options ipv6 disable=1',
      match  => '^options ipv6 disable',
      noop   => $run,
    }
  }
}
