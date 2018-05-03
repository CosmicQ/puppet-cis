class cis::windows::scm {

  # This is all registry crap.  We can do this with hiera and a sweet function.
  
  $scm_registry.each | String $name, Hash $values | {
    dsc_registry { $name:
      dsc_ensure    => 'Present',
      dsc_key       => $values[key],
      dsc_valuename => $values[valuename],
      dsc_valuetype => $values[valuetype],
      dsc_valuedata => $values[valuedata],
    }
  }
 

}
