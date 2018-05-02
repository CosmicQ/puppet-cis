# Filesystem Integrity Checking
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

    # 1.3.1 - Ensure AIDE is installed
    package {'aide':
      ensure => installed,
      noop   => $run,
    }
    exec { 'initialize_aide':
      command => '/usr/sbin/aide --init',
      creates => '/var/lib/aide/aide.db.new.gz',
      require => Package['aide'],
      noop    => $run,
    }

    # 1.3.2 - Ensure filesystem integrity is regularly checked
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