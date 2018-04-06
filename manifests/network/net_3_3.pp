class cis::network::net_3_3 (

){

  # 3.3.1
  sysctl { 'net.ipv6.conf.all.accept_ra':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }
  sysctl { 'net.ipv6.conf.default.accept_ra':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }

  # 3.3.2
  sysctl { 'net.ipv6.conf.all.accept_redirects':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }
  sysctl { 'net.ipv6.conf.default.accept_redirects':
    ensure  => present,
    value   => '0',
    comment => 'Setting managed by Puppet.',
    noop    => true
  }

  # 3.3.3
  kernel_parameter { 'ipv6.disable':
    ensure  => present,
    value   => '1',
    noop    => true
  }

}
