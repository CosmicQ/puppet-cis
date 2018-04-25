class cis::setup::set_1_1 (

  String $status            = 'disable',
  Array  $filesystem_list   = undef,
  Hash   $filesystem_mounts = undef

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

  # Filesystem List is found in data/setup.yaml
  $filesystem_list.each | String $filesystem | {
    file_line { $filesystem:
      ensure  => present,
      path    => '/etc/modprobe.d/CIS.conf',
      line    => "install ${filesystem} /bin/true",
      noop    => $run,
    }
  }

  # Filesystem Mounts are found in data/setup.yaml
  $filesystem_mounts.each | String $mount, String $options | {
    mount { $mount:
      options => $options,
      noop    => $run,
    }
  }

  file {'/etc/fstab':
    owner     => root,
    group     => root,
    mode      => '0600',
    noop      => $run,
  }

  # 1.1.6
  mount {'/var/tmp':
    ensure    => 'mounted',
    device    => '/tmp',
    fstype    => 'none',
    options   => 'bind',
    noop      => $run,
  }

  file {'/tmp':
    ensure    => directory,
    owner     => root,
    group     => root,
    mode      => '1777',
    noop      => $run,
  }

}
