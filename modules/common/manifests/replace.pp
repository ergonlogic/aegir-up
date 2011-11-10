# Inspired by: https://labs.riseup.net/code/projects/shared-common/repository/revisions/master/raw/manifests/defines/replace.pp

define common::replace($file, $pattern, $replacement) {
  $pattern_no_slashes = slash_escape($pattern)
  $replacement_no_slashes = slash_escape($replacement)
  exec { "replace_${name}":
    command => "/usr/bin/perl -pi -e \"s/${pattern_no_slashes}/${replacement_no_slashes}/\" '${file}'",
#    onlyif => "/usr/bin/perl -ne 'BEGIN { \$ret = 1; } \$ret = 0 if /${pattern_no_slashes}/ && ! /\\Q${replacement_no_slashes}\\E/; END { exit \$ret; }' '${file}'",
    alias => "exec_$name",
  }
}
