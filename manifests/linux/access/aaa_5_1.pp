# Configure Cron
class cis::linux::access::aaa_5_1 (

  String $status,
  String $cron_package,
  String $cron_service,
  Array  $cron_allow,
  Hash   $cron_files

){

  $check = $status ? {
    'enable' => true,
    'notify' => true,
    default  => false,
  }

  if $check {

    $run = $status ? {
      'enable' => false,
      default  => true,
    }

    $defaults = {
      owner => '0',
      group => '0',
      noop  => $run,
    }

    # We will use hiera as our default for cron.allow, but allow
    # override by custom facts...  for now.  This needs to
    # be reviewed.
    if $facts['cis_cron_allow'] {
      $cron_allow_content = $facts['cis_cron_allow']
    } else {
      $cron_allow_content = $cron_allow
    }

    package { $cron_package:
      ensure => 'installed',
      noop   => $run,
    }

    # 5.1.1
    service { $cron_service:
      ensure  => 'running',
      enable  => true,
      name    => $cron_service,
      require => Package[$cron_package],
      noop    => $run,
    }

    # 5.1.2-7
    create_resources(file, $cron_files, $defaults)

    # 5.1.8
    file { '/etc/cron.deny': ensure => absent, noop => $run }
    file { '/etc/at.deny':   ensure => absent, noop => $run }
    file { '/etc/cron.allow':
      ensure  => file,
      mode    => '0600',
      owner   => '0',
      group   => '0',
      content => [ $cron_allow_content ],
      noop    => $run,
    }

  }
}