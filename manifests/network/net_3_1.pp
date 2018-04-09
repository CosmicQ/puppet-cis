class cis::network::net_3_1 {

  $run = $cis::network::net_3_1::status ? {
    'enable' => false,
    'notify' => true,
    default  => undef,
  }

  # 3.1.1
  if $run {
    sysctl { 'net.ipv4.ip_forward':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run
    }
  }

  # 3.1.2
  if $run {
    sysctl { 'net.ipv4.conf.all.send_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run
    }
  }
  # 3.1.2
  if $run {
    sysctl { 'net.ipv4.conf.default.send_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run
    }
  }
}
