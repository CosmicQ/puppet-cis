# Secure Boot Settings
class cis::setup::set_1_4 (

  String $status,
  Hash $grub_files,
  String $grub_pass
  
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
    owner => '0',
    group => '0',
    noop  => $run,
  }
  if $check {

    # This deals with the grub files and directories.
    # grub_files are OS release dependent and in hiera
    create_resources(file, $grub_files, $defaults)

    # Grub needs a password.
    if $facts['os']['release']['major'] == '6' {
      file_line { 'grub_password_6':
        ensure => present,
        path   => '/boot/grub/grub.conf',
        line   => "password --md5 ${grub_pass}",
        match  => '^password',
        noop   => $run,
      }
      # 1.4.3
      file_line { 'boot_single':
        ensure => present,
        path   => '/etc/sysconfig/init',
        line   => 'SINGLE=/sbin/sulogin',
        match  => '^SINGLE=',
        noop   => $run,
      }
      # 1.4.4
      file_line { 'interactive_boot':
        ensure => present,
        path   => '/etc/sysconfig/init',
        line   => 'PROMPT=no',
        match  => '^PROMPT=',
        noop   => $run,
      }
    }

    if $facts['os']['release']['major'] == '7' {
      file { '/boot/grub2/user.cfg':
        ensure => file,
        owner  => '0',
        group  => '0',
        mode   => '0600',
        noop   => $run,
      }

      file_line { 'grub_password_7':
        ensure => present,
        path   => '/etc/default/grub',
        line   => "GRUB2_PASSWORD=\"${grub_pass}\"",
        match  => '^GRUB2_PASSWORD=',
        require => File['/boot/grub2/user.cfg'],
        noop   => $run,
      }
      # 1.4.4
      file_line { 'single_auth1':
        ensure => present,
        path   => '/usr/lib/systemd/system/rescue.service',
        line   => "ExecStart=-/bin/sh -c \"/sbin/sulogin; /usr/bin/systemctl --fail --no-block default",
        match  => '^ExecStart=',
        noop   => $run,
      }
      file_line { 'single_auth2':
        ensure => present,
        path   => '/usr/lib/systemd/system/emergency.service',
        line   => "ExecStart=-/bin/sh -c \"/sbin/sulogin; /usr/bin/systemctl --fail --no-block default",
        match  => '^ExecStart=',
        noop   => $run,
      }
    }
  }
}