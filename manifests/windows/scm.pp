class cis::windows::scm   (

  String $status,
  Hash   $scm_registry,

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

    # This is all registry crap.  We can do this with hiera and a sweet function.
    $scm_registry.each | String $name, Hash $values | {
      dsc_registry { $name:
        dsc_ensure    => 'Present',
        dsc_key       => $values[key],
        dsc_valuename => $values[valuename],
        dsc_valuetype => $values[valuetype],
        dsc_valuedata => $values[valuedata],
        noop          => $run,
      }
    }

  }
}