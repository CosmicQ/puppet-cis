class cis::redhat::network (

){

  $protocol_list = [
    'dccp',
    'sctp',
    'rds',
    'tipc',
  ]

  $protocol_list.each | String $protocol | {
    if getvar($protocol) != 'disabled' {
      file_line { $protocol:
        ensure => present,
        path   => '/etc/modprobe.d/CIS.conf',
        line   => "install ${protocol} /bin/true",
	noop   => true
      }
    }
  }

  if $ipv4_forwarding == 'disabled' {
    sysctl { 'net.ipv4.ip_forward':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_ignore_icmp_bogus_responses == 'enabled' {
    sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_ignore_icmp_broadcasts == 'enabled' {
    sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_accept_icmp_redirects == 'disabled' {
    sysctl { 'net.ipv4.conf.all.accept_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
    sysctl { 'net.ipv4.conf.default.accept_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_log_suspicious_packets == 'enabled' {
    sysctl { 'net.ipv4.conf.all.log_martians':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
    sysctl { 'net.ipv4.conf.default.log_martians':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_send_redirects == 'disabled' {
    sysctl { 'net.ipv4.conf.all.send_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
    sysctl { 'net.ipv4.conf.default.send_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_reverse_path_filtering == 'enabled' {
    sysctl { 'net.ipv4.conf.all.rp_filter':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
    sysctl { 'net.ipv4.conf.default.rp_filter':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_secure_redirects == 'disabled' {
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
    sysctl { 'net.ipv4.conf.default.secure_redirects':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_source_routing == 'disabled' {
    sysctl { 'net.ipv4.conf.all.accept_source_route':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
    }
    sysctl { 'net.ipv4.conf.default.accept_source_route':
      ensure  => present,
      value   => '0',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv4_tcp_syncookies == 'enabled' {
    sysctl { 'net.ipv4.tcp_syncookies':
      ensure  => present,
      value   => '1',
      comment => 'Setting managed by Puppet.',
      noop    => true
    }
  }

  if $ipv6_accept_router_advertisements == 'disabled' {
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
  }

  if $ipv6_accept_packet_redirects == 'disabled' {
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
  }

  if $ipv6 == 'disabled' {
    kernel_parameter { 'ipv6.disable':
      ensure  => present,
      value   => '1',
      noop    => true
    }
  }

  if $facts['networking']['interfaces'] == undef {
    notice ('Cannot configure wireless interfaces because required external facts are unavailable. This may be transient.')
  } else {
    if $disable_wireless_interfaces == 'enabled' {
      $facts['networking']['interfaces'].each | String $interface, Hash $info | {
        if $interface =~ 'wlan' {
          exec { "ip link set ${interface} down":
            path => [ '/sbin', '/bin' ],
            noop => true
          }
        }
      }
    }
  }

  if $hosts_allow != '' {
    file { '/etc/hosts.allow':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => $hosts_allow,
      noop    => true
    }
  }

  if $hosts_deny != '' {
    file { '/etc/hosts.deny':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => $hosts_deny,
      noop    => true
    }
  }

}
