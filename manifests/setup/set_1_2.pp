# Configure Software Updates
class cis::setup::set_1_2 (

  String $status,

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

  if $check {
    package {'gpg-pubkey':
      ensure  => installed,
      noop    => $run,
    }

    file_line { '1.2.3 Ensure gpgcheck is globally activated (Scored)':
      ensure => present,
      path   => '/etc/yum.conf',
      line   => 'gpgcheck=1',
      match  => '^gpgcheck',
      noop   => $run,
    }
  }
}