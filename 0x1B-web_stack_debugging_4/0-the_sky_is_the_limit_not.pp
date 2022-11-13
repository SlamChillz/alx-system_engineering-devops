# Fixes an nginx site that can't handle multiple concurrent requests

exec { 'ulimit':
  command => "sed -i 's/^ULIMIT=.*/ULIMIT=\"-n 500\"/' /etc/default/nginx",
  path    => '/usr/bin:/usr/sbin:/bin',
  notify  => Service['nginx']
}

service { 'nginx':
  ensure => running,
  enable => true,
}
