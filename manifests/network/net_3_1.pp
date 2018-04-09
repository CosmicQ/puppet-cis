class cis::network::net_3_1 (

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
    # 3.1.1
    $kernel_parameters = {
      'net.ipv4.ip_forward' => '0',
      'net.ipv4.conf.all.send_redirects' => '0',
      'net.ipv4.conf.default.send_redirects' => '0',
    }

    $kernel_parameters.each |String $k_param, String $val| {
      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        comment => 'Setting managed by Puppet',
        noop    => $run,
      }
    }
  }
}