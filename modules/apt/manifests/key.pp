class apt::key ($dir, $url) {

  exec {'get key':
    command => "/usr/bin/wget -nc -P ${dir} ${url}/key.asc",
    unless  => "/bin/ls ${dir}| /bin/grep 'key.asc'",
  }

  exec {'add key':
    command => "/usr/bin/apt-key add ${dir}/key.asc",
  }

  Exec['get key'] -> Exec['add key']

}
