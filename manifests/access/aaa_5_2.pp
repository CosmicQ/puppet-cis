# SSH Server Configuration
# Currently handled via a custom ssh module
class cis::access::aaa_5_2 (

  String $status,
  Hash   $sshd_config

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

    file { '/etc/ssh/sshd_config':
      ensure => file,
      mode   => '0600',
      owner  => '0',
      group  => '0',
      noop   => $run,
    }

    $sshd_config.each | String $param, String $val | {
      file_line { $param:
        ensure  => present,
        path    => '/etc/ssh/sshd_config',
        line    => "${param} ${val}",
        match   => "^${param}",
        noop    => $run,
      }
    }
  }
}