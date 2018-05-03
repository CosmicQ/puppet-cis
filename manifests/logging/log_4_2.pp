# Configure Logging
class cis::loging::log_4_2 (

  String $status,

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
    # 4.2.3
    package { 'cis-log':
      ensure => present,
      name   => 'rsyslog',
      noop   => $run,
    }
    # 4.2.1.1
    service { 'cis-log':
      ensure => running,
      name   => 'rsyslog',
      noop   => $run,
    }

    # 4.2.1.3
    file_line { 'FileCreateMode':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => "$FileCreateMode 0640",
      match  => "^$FileCreateMode",
      noop   => $run,
    }

  }
}