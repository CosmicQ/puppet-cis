# Network Parameters (Host and Router)
class cis::linux::network::net_3_2 (

  String $status,
  Hash   $kernel_parameters

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
    # 3.2.1 - 3.2.8
    $kernel_parameters.each |String $k_param, String $val| {
      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        noop    => $run,
      }
    }
  }
}
