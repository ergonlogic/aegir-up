define aegir::platform ($makefile, $options="", $platforms_dir="/var/aegir/platforms") {

  include common

  drush::make {"${name}":
    makefile      => $makefile,
    options       => $options,
    platforms_dir => $platforms_dir,
  }

  exec {"provision-save-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush --root=${platforms_dir}/${name} --context_type='platform' provision-save @platform_${name}",
    environment => "HOME=/var/aegir",
    require     => Drush::Make["${name}"],
  }

  common::replace {"add makefile to platform_${name}":
    file        => "/var/aegir/.drush/platform_$name.alias.drushrc.php",
    pattern     => "''",
    replacement => "'${makefile}'",
    require     => Exec["provision-save-${name}"],
  }

  exec {"hosting-import-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush @hostmaster hosting-import @platform_${name}",
    environment => "HOME=/var/aegir",
    require     => Common::Replace["add makefile to platform_${name}"],
  }
                          
}
