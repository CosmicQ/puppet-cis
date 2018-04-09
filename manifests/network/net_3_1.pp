class cis::network::net_3_1 (

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
    # 3.1.1
    sysctl { 'net.ipv4.ip_forward':
      ensure  => present,
      value   => '0',
      target  => '/etc/sysctl.d/net.ipv4.ip_forward.conf',
      comment => 'Setting managed by Puppet.',
      noop    => $run
    }

    # 3.1.2
    sysctl { 'net.ipv4.conf.all.send_redirects':
      ensure  => present,
      value   => '0',
      target  => '/etc/sysctl.d/net.ipv4.conf.all.send_redirects.conf',
      comment => 'Setting managed by Puppet.',
      noop    => $run
    }
    
    # 3.1.2
    sysctl { 'net.ipv4.conf.default.send_redirects':
      ensure  => present,
      value   => '0',
      target  => '/etc/sysctl.d/net.ipv4.conf.default.send_redirects.conf',
      comment => 'Setting managed by Puppet.',
      noop    => $run
    }
  }
}
