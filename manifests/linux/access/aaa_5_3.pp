# Configure PAM
class cis::linux::access::aaa_5_3 (

  String $status,
  Hash   $pwquality

){

  $check = $status ? {
    'enable' => true,
    'notify' => true,
    default  => false,
  }

  $run = $status ? {
    'enable' => false,
    default  => true,
  }

  if $check {

    # 5.3.1
    if $facts['os']['release']['major'] == '6' {
      #RH6
      file_line { 'pam_pwquality':
          ensure  => present,
          path    => '/etc/pam.d/system-auth',
          line    => "password\trequisite\tpam_cracklib.so try_first_pass retry=3 minlen=${pwquality[minlen]} dcredit=${pwquality[dcredit]} ucredit=${pwquality[ucredit]} ocredit=${pwquality[ocredit]} lcredit=${pwquality[lcredit]}",
          match   => "^password\s+requisite\s+pam_cracklib.so",
          noop    => $run,      
      }
    } elsif $facts['os']['release']['major'] == '7' {
      #RH7
      $pwquality.each | String $param, String $val | {
        file_line { 'pam_pwquality':
            ensure  => present,
            path    => '/etc/security/pwquality.conf',
            line    => "${param}=${val}",
            match   => "^${param}=",
            noop    => $run,      
        }
      }
    }

    # 5.3.2, 5.3.3, 5.3.4
    # I may need to use a template for this.  Commenting out for now.
    # Saving for tech debt.  $$$
#    file_line { 'pam_lockout_system':
#      ensure  => present,
#      path    => '/etc/pam.d/system-auth'
#      line    => "password\trequired\tpam_faillock.so preauth audit silent deny=5 unlock_time=900",
#      match   => "^password\s+required\s+pam_faillock.so",
#      noop    => $run,      
#    }
#    file_line { 'pam_lockout_password':
#      ensure  => present,
#      path    => '/etc/pam.d/password-auth'
#      line    => "password\trequired\tpam_faillock.so preauth audit silent deny=5 unlock_time=900",
#      match   => "^password\s+required\s+pam_faillock.so",
#      noop    => $run,      
#    }

    $sshd_config.each | String $param, String $val | {
      file_line { $param:
        ensure  => present,
        path    => '/etc/ssh/sshd_config',
        line    => "${param} ${val}",
        match   => "^${param}",
        noop    => $run,
      }
    }

  }
}