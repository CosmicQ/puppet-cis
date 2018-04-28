class cis::setup::set_1_3 (

  String $status,
  Hash   $aide_cron

){

  $check = $status ? {
    'enable'  => true,
    'notify'  => true,
    default   => false,
  }

  $run = $status ? {
    'enable'  => false,
    default   => true,
  }

  if $check {
    package {'aide':
      ensure => installed,
      noop   => $run,
    }

    exec { 'initialize_aide':
      command => '/usr/sbin/aide --init',
      creates => '/var/lib/aide/aide.db.gz',
      require => Package['aide'],
      noop    => $run,
    }

    cron { 'aide-check':
      command => '/usr/sbin/aide --check',
      user    => root,
      hour    => $aide_cron[hour],
      minute  => $aide_cron[minute],
      require => Exec['initialize_aide'],
      noop    => $run,
    }
  }
}