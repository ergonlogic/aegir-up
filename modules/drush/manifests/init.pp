class drush {

  include drush::preferences

  package { 'drush':
    ensure => present,
    require => [
      Class['drush::preferences'],
    ],
  }

}
