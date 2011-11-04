class aegir::sources {

  include apt

  class {'apt::sources':
    dir  => '/tmp/vagrant-puppet/manifests/files',
    name => 'aegir',
  }

  class {'apt::key':
    dir => '/tmp/vagrant-puppet/manifests/files',
    url => 'http://debian.aegirproject.org',
    require => Class['apt::sources'],
  }

  class {'apt::update':
    require => Class['apt::key'],
  }

}
