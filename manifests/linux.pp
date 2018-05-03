class cis::linux {

  file { '/etc/modprobe.d':
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/modprobe.d/CIS.conf' :
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => File['/etc/modprobe.d'],
  }

  include cis::linux::setup
  include cis::linux::services
  include cis::linux::network
  include cis::linux::logging
  include cis::linux::access
  include cis::linux::system

}