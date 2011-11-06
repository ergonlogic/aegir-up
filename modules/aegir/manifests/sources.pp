class aegir::sources {

  include apt

  class {'apt::sources':
    dir  => 'modules/aegir',
    name => 'aegir',
  }

  class {'apt::key':
    dir => 'files',
    url => 'http://debian.aegirproject.org',
    require => Class['apt::sources'],
  }

  class {'apt::update':
    require => Class['apt::key'],
  }

}
