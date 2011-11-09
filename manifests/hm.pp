# A Puppet manifest to provision an Aegir Hostmaster server

file { '/etc/motd':
  content => "Welcome to your Aegir Hostmaster virtual machine!
              Built by Vagrant. Managed by Puppet.\n
              Developed and maintained by Ergon Logic Enterprises.\n"
}

include aegir

include drush

class {'drush::status':
  site_alias => 'hostmaster',
  require => Class['aegir'],
}

class {'drush::dl':
  site_alias => '@hostmaster',
  module => 'hosting_queue_runner',
  cwd => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
  require => Class['aegir'],
}

