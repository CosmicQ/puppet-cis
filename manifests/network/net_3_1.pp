class cis::network::net_3_1 (

  String $status = 'disable'

){

  notify { "Starting 3.1": }

  $run = $status ? {
    'enable' => false,
    'notify' => true,
    default  => undef,
  }

  notify { "Run = ${run}": }

  if $run {
    notify { "Run is a go.  Starting sysctl": }
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
