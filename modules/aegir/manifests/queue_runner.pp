class aegir::queue_runner {

  include drush

  drush::dl { 'hosting_queue_runner':
    site_alias => '@hostmaster',
    cwd        => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
    require    => Class['aegir'],
  }

  drush::en { 'hosting_queue_runner':
    site_alias => '@hostmaster',
    cwd        => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
    require    => Drush::Dl["hosting_queue_runner"],
  }

  exec {"cp-script":
    path    => '/usr/bin:/bin',
    command => "cp /var/aegir/hostmaster-6.x-1.5/sites/aegir.local/modules/hosting_queue_runner/init.d.example /etc/init.d/hosting-queue-runner",
    require => Drush::Dl["hosting_queue_runner"],
  }

  exec {"symlinks-runlevels":
    command => "/usr/sbin/update-rc.d hosting-queue-runner defaults",
    require => Exec["cp-script"],
  }

  exec {"run-script":
    path    => '/usr/bin:/bin',
    command => "/etc/init.d/hosting-queue-runner start",
    require => Exec["symlinks-runlevels"],
  }

}
