define apt::sources ($dir, $name) {

  file {"${name}.list":
    path   => "/etc/apt/sources.list.d/${name}.list",
    source => "${dir}/${name}.list",
  }

}
