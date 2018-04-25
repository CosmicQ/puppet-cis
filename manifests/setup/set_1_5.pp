

      sysctl { "${k_param}":
        ensure  => present,
        value   => "${val}",
        target  => "/etc/sysctl.d/${k_param}.conf",
        comment => 'Setting managed by Puppet',
        noop    => $run,

fs.suid_dumpable = 0
kernel.randomize_va_space = 2

/etc/security/limits.conf
    file_line { '(3.3.3) - Ensure IPv6 is disabled (Not Scored)':
      ensure => present,
      path   => '/etc/modprobe.d/CIS.conf',
      line   => 'options ipv6 disable=1',
      match  => '^options ipv6 disable',
      noop   => $run,
    }

* hard core 0



# yum remove prelink