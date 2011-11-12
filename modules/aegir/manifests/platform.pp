define aegir::platform ($makefile, $options="", $platforms_dir="/var/aegir/platforms") {

  exec {"provision-save-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush --root=${platforms_dir}/${name} --context_type='platform' --makefile='${makefile}' provision-save @platform_${name}",
    environment => "HOME=/var/aegir",
  }

  exec {"hosting-import-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush @hostmaster hosting-import @platform_${name}",
    environment => "HOME=/var/aegir",
    require     => Exec["provision-save-${name}"], 
  }
                          
}
