# Filesystem Configuration
class cis::setup::set_1_1 (

  String $status,
  Array  $filesystem_list,
  Hash   $filesystem_mounts,
  Hash   $autofs

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
    # 1.1.1.1-8
    $filesystem_list.each | String $filesystem | {
      file_line { $filesystem:
        ensure  => present,
        path    => '/etc/modprobe.d/CIS.conf',
        line    => "install ${filesystem} /bin/true",
        noop    => $run,
      }
    }
  
    # 1.1.3-1.1.20
    # This skips the 'level 2' items for now.
    create_resources(mount, $filesystem_mounts, $defaults)

    file {'/etc/fstab':
      owner     => root,
      group     => root,
      mode      => '0600',
      noop      => $run,
    }

    # 1.1.21 - Ensure sticky bit is set on all world-writable directories
    # We control /tmp.  Other directories will need to be detected via audit
    file {'/tmp':
      ensure    => directory,
      owner     => root,
      group     => root,
      mode      => '1777',
      noop      => $run,
    }

    # 1.1.22 - Disable Automounting
    service { 'cis_autofs':
      ensure    => $autofs[ensure],
      name      => $autofs[name],
      enable    => $autofs[enable],
    }

  }
}
