class drush::preferences {

  file {'/etc/apt/preferences.d/drush':
    ensure => present,
    source => "modules/drush/drush",
  }

}
