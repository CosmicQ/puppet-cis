# Class: cis
# ===========================
#
# Full description of class cis here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'cis':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class cis (


){

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

  # 3 - Network Configuration
  include cis::network::net_3_1
  include cis::network::net_3_2
  include cis::network::net_3_3
  include cis::network::net_3_4
  include cis::network::net_3_5
  include cis::network::net_3_6
  include cis::network::net_3_7

}
