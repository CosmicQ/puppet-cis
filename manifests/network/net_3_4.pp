class cis::network::net_3_4 (

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
    # 3.4.1
    # tcp_wrappers
    package { 'tcp_wrappers':
      ensure => installed,
      noop   => $run,
    }

    # 3.4.2, 3.4.4
    file { '/etc/hosts.allow':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => $hosts_allow,
      noop    => $run,
    }

    # 3.4.3, 3.4.5
    file { '/etc/hosts.deny':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => $hosts_deny,
      noop    => $run,
    }
  }
}
