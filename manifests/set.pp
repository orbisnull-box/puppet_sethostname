class sethostname::set inherits sethostname {
  if ($fqdn != undef) {
  file { "/etc/hostname":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "$fqdn\n",
    notify  => Exec["set-hostname"],
  }
  exec { "set-hostname":
    command => '/bin/hostname -F /etc/hostname',
    unless  => "/usr/bin/test `hostname` = `/bin/cat /etc/hostname`",
  }
  }
}
