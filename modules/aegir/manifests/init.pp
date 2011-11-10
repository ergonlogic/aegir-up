class aegir {

include aegir::dependencies
include aegir::sources

  package { 'aegir':
    ensure       => present,
    responsefile => 'files/aegir.preseed',
    require      => Class['aegir::dependencies'],
  }

}

class aegir::sources {

  include apt

  class {'apt::sources':
    dir  => 'modules/aegir',
    name => 'aegir',
  }

  class {'apt::key':
    dir     => 'files',
    url     => 'http://debian.aegirproject.org',
    require => Class['apt::sources'],
#    creates => 'files/key.asc',
  }

  class {'apt::update':
    require => Class['apt::key'],
  }

}

class aegir::dependencies {

  include drush

  package {'drush-make':
    ensure  => present,
    require => [
      Package['drush'],
      Class['aegir::sources'],
    ],
  }

  package {'mysql-server' :
    ensure       => present,
    responsefile => 'files/mysql-server.preseed',
  }

  package {'postfix' :
    ensure       => present,
    responsefile => 'files/postfix.preseed',
  }

}
