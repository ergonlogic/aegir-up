define drush::en ($site_alias = "", $cwd = "/var/aegir") {

  exec {"drush-en-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush ${site_alias} en ${name} -y >> /var/aegir/drush.log 2>&1",
    environment => "HOME=/var/aegir",
    cwd         => $cwd,
    require     => Exec["drush-dl-${name}"],
  }
                          
}
