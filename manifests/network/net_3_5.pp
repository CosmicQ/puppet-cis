class cis::network::net_3_5 {

  $run = $cis::network::net_3_5::status ? {
    'enable' => false,
    'notify' => true,
    default  => undef,
  }
  
  if $run {

    # 3.5.1, 3.5.2, 3.5.3, 3.5.4
    $protocol_list = [
      'dccp',
      'sctp',
      'rds',
      'tipc',
    ]

    $protocol_list.each | String $protocol | {
      file_line { $protocol:
        ensure => present,
        path   => '/etc/modprobe.d/CIS.conf',
        line   => "install ${protocol} /bin/true",
        noop   => $run,
      }
    }
  }
}
