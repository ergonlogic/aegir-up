define drush::dl ($site_alias = "", $cwd = "/var/aegir") {

  exec {"drush-dl-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush ${site_alias} dl ${name} -y  >> /var/aegir/drush.log 2>&1",
    environment => "HOME=/var/aegir",
    cwd         => $cwd,
  }
                          
}
