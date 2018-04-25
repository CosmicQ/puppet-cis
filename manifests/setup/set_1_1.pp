class cis::setup::set_1_1 {

  $filesystem_list = [
    'cramfs',
    'freevxfs',
    'jffs2',
    'hfs',
    'hfsplus',
    'squashfs',
    'udf',
    'vfat'
  ]

  $filesystem_list.each | String $filesystem | {
    file_line { $filesystem:
      ensure => present,
      path   => '/etc/modprobe.d/CIS.conf',
      line   => "install ${filesystem} /bin/true",
      noop   => $run,
    }
  }

  file {'/etc/fstab':
    owner => root,
    group => root,
    mode  => '0600',
  }

  mount {'/tmp':
    options => 'nodev,nosuid,noexec',
  }

  mount {'/var':
    options => 'nodev',
  }

  mount {'/var/log':
    options => 'nodev',
  }

  mount {'/var/log/audit':
    options => 'nodev',
  }

  mount {'/home':
    options => 'nodev',
  }

  mount {'/opt':
    options => 'nodev',
  }

  mount {'/dev/shm':
    options => 'nodev,nosuid,noexec',
  }

  # 1.1.6
  mount {'/var/tmp':
    ensure  => 'mounted',
    device  => '/tmp',
    fstype  => 'none',
    options => 'bind',
  }

  file {'/tmp':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '1777',
  }


}
