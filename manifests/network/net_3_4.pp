class cis::network::net_3_4 (

){

  # 3.4.1
  # Add package resource for tcp_wrappers

  # 3.4.2, 3.4.4
  file { '/etc/hosts.allow':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => $hosts_allow,
    noop    => true
  }

  # 3.4.3, 3.4.5
  file { '/etc/hosts.deny':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => $hosts_deny,
    noop    => true
  }

}
