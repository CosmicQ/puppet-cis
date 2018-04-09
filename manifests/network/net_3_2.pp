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
      'net.ipv4.conf.all.accept_source_route' => { value => '0' },
      'net.ipv4.conf.default.accept_source_route' => { value => '0' },
      'net.ipv4.conf.all.accept_redirects' => { value => '0' },
      'net.ipv4.conf.default.accept_redirects' => { value => '0' },
      'net.ipv4.conf.all.secure_redirects' => { value => '0' },
      'net.ipv4.conf.default.secure_redirects' => { value => '0' },
      'net.ipv4.conf.all.log_martians' => { value => '1' },
      'net.ipv4.conf.default.log_martians' => { value => '1' },
      'net.ipv4.icmp_echo_ignore_broadcasts' => { value => '1' },
      'net.ipv4.icmp_ignore_bogus_error_responses' => { value => '1' },
      'net.ipv4.conf.all.rp_filter' => { value => '1' },
      'net.ipv4.conf.default.rp_filter' => { value => '1' },
      'net.ipv4.tcp_syncookies' => { value => '1' },
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
