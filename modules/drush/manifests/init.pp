class drush {

  include drush::preferences

  package { 'drush':
    ensure  => present,
    require => [
      Class['drush::preferences'],
    ],
  }

}

class drush::preferences {

  file {'/etc/apt/preferences.d/drush':
    ensure => present,
    source => "modules/drush/drush",
  }

}
