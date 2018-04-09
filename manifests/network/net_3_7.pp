class cis::network::net_3_7 (

  String $status = 'disable'

){

  $run = $status ? {
    'enable' => false,
    'notify' => true,
    default  => undef,
  }
  
  if $run {

    # 3.7 - Ensure wireless interfaces are disabled
   
    if $facts['networking']['interfaces'] == undef {
      notice ('Cannot configure wireless interfaces because required external facts are unavailable. This may be transient.')
    } else {
      $facts['networking']['interfaces'].each | String $interface, Hash $info | {
        if $interface =~ 'wlan' {
          exec { "ip link set ${interface} down":
            path => [ '/sbin', '/bin' ],
            noop => $run
          }
        }
      }
    }
  }
}
