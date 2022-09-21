# A manifest to install nginx web server

$doc_root = '/var/www/html'

exec { 'apt-get update':
  command => 'apt-get -y update',
  path    => '/usr/bin:/usr/sbin:/bin'
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-get update']
}

file { $doc_root:
  ensure => 'directory',
}

file { '$doc_root/index.html':
  ensure  => 'present',
  content => 'Hello World',
  require => File[$doc_root]
}

file_line { '/etc/nginx/sites-available/default':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  line    => '\trewrite ^/redirect_me https://www.google.com permanent;\n}',
  match   => '^}$',
  notify  => Service['nginx'],
  require => Package['nginx']
}

service { 'nginx':
  ensure => running,
  enable => true
}
