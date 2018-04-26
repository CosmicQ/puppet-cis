class cis::network::net_3_5 (

  String $status = 'disable'
  Array $protocol_list

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
    # 3.5.1, 3.5.2, 3.5.3, 3.5.4
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
