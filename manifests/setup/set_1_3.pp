  package {'aide':
    ensure => installed,
  }
  $aide_check_cron = hiera('cis::aide_check_cron',{hour=>5,minute=>0})
  $aide_check_hour = $aide_check_cron[hour]
  $aide_check_min  = $aide_check_cron[minute]

  cron { 'aide-check':
    command => '/usr/sbin/aide --check',
    user    => root,
    hour    => $aide_check_hour,
    minute  => $aide_check_min,
    require => Package['aide'],
  }