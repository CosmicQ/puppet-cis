class cis::network::net_3_2 (

  String $status = 'disable'

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
    # 3.2.1 - 3.2.8
    $kernel_parameters = {
      'net.ipv4.conf.all.accept_source_route' => '0',
      'net.ipv4.conf.default.accept_source_route' => '0',
      'net.ipv4.conf.all.accept_redirects' => '0',
      'net.ipv4.conf.default.accept_redirects' => '0',
      'net.ipv4.conf.all.secure_redirects' => '0',
      'net.ipv4.conf.default.secure_redirects' => '0',
      'net.ipv4.conf.all.log_martians' => '1',
      'net.ipv4.conf.default.log_martians' => '1',
      'net.ipv4.icmp_echo_ignore_broadcasts' => '1',
      'net.ipv4.icmp_ignore_bogus_error_responses' => '1',
      'net.ipv4.conf.all.rp_filter' => '1',
      'net.ipv4.conf.default.rp_filter' => '1',
      'net.ipv4.tcp_syncookies' => '1',
    }

    $kernel_parameters.each |String $k_param, Hash $val| {
      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        comment => 'Setting managed by Puppet',
        noop    => $run,
      }
    }
  }
}
