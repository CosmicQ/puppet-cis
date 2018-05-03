# Configure Software Updates
class cis::linux::setup::set_1_2 (

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

    # 1.2.2 - Ensure gpgcheck is globally activated
    file_line { 'gpgcheck':
      ensure => present,
      path   => '/etc/yum.conf',
      line   => 'gpgcheck=1',
      match  => '^gpgcheck',
      noop   => $run,
    }

    # 1.2.3 - Ensure GPG keys are configured
    package {'gpg-pubkey':
      ensure  => installed,
      noop    => $run,
    }

  }
}