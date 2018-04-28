class cis::setup::set_1_1 (

  String $status,
  Array  $filesystem_list,
  Hash   $filesystem_mounts

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

  $defaults = {
    noop  => $run,
  }

  if $check {
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
    create_resources(mount, $filesystem_mounts, $defaults)

    file {'/etc/fstab':
      owner     => root,
      group     => root,
      mode      => '0600',
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
}
