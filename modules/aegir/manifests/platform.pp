define aegir::platform ($makefile, $options="", $platforms_dir="/var/aegir/platforms", $makefiles_dir="") {

  drush::make {"${name}":
    makefile      => $makefile,
    options       => $options,
    platforms_dir => $platforms_dir,
    makefiles_dir => $makefiles_dir,
  }

  exec {"provision-save-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush --root=${platforms_dir}/${name} --context_type='platform' provision-save @platform_${name}",
    environment => "HOME=/var/aegir",
    require     => Drush::Make["${name}"],
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
