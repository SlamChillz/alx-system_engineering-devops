# Fix file limit for holberton user

exec { 'holberton_soft_limit':
  command => 'sed -i "/holberton soft nofile/s/.*/holberton soft nofile 65535/" /etc/security/limits.conf',
  path    => '/bin:/usr/bin:/usr/sbin'
}

-> exec { 'holberton_hard_limit':
  command => 'sed -i "/holberton hard nofile/s/.*/holberton hard nofile 65535/" /etc/security/limits.conf',
  path    => '/bin:/usr/bin:/usr/sbin'
}
