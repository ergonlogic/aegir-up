class drush::dl ($site_alias, $module, $cwd = "/var/aegir") {

  exec {"drush-dl": #${site_alias}-dl": #-${module}":
    path => '/usr/bin:/bin',
    user  => 'aegir',
    group => 'aegir',
    command => "drush ${site_alias} dl ${module} -y > /var/aegir/drush.log",
    environment => "HOME=/var/aegir",
    cwd => $cwd,
  }
                          
}
