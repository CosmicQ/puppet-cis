class cis::network::net_3_3 (

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
    # 3.3.1
    sysctl { 'net.ipv6.conf.all.accept_ra':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv6.conf.default.accept_ra':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.3.2
    sysctl { 'net.ipv6.conf.all.accept_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv6.conf.default.accept_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
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
