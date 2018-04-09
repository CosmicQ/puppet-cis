class cis::network::net_3_2 {

  $run = $cis::network::net_3_2::status ? {
    'enable' => false,
    'notify' => true,
    default  => undef,
  }
  
  # 3.2.1
  if $run {
    sysctl { 'net.ipv4.conf.all.accept_source_route':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv4.conf.default.accept_source_route':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    
    # 3.2.2
    sysctl { 'net.ipv4.conf.all.accept_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv4.conf.default.accept_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.2.3
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv4.conf.default.secure_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.2.4
    sysctl { 'net.ipv4.conf.all.log_martians':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv4.conf.default.log_martians':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.2.5
    sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.2.6
    sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.2.7
    sysctl { 'net.ipv4.conf.all.rp_filter':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
    sysctl { 'net.ipv4.conf.default.rp_filter':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }

    # 3.2.8
    sysctl { 'net.ipv4.tcp_syncookies':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => $run,
    }
  }
}
