# User Accounts and Environment
class cis::access::aaa_5_4 (

  String $status,

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

#  if $check {

# 5.4.1.1-4
# grep PASS_MAX_DAYS /etc/login.defs
#PASS_MAX_DAYS 90
#PASS_MIN_DAYS 7
#PASS_WARN_AGE 7
#INACTIVE=30

# 5.4.2 - System account are non-login

#root gid = 0

# 5.4.4
# grep "^umask" /etc/bashrc
#umask 027
# grep "^umask" /etc/profile
#umask 027




#  }
}