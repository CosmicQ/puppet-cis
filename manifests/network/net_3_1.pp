class cis::network::net_3_1 (

){

  # 3.1.1
  sysctl { 'net.ipv4.ip_forward':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }

  # 3.1.2
  sysctl { 'net.ipv4.conf.all.send_redirects':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }

  # 3.1.2
  sysctl { 'net.ipv4.conf.default.send_redirects':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }

}
