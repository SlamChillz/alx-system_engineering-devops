# Fix file limit
exec { 'holberton_s_limit':
  command => '/usr/bin/env sudo sed -i "/holberton soft nofile/s/.*/holberton soft nofile 30000/" /etc/security/limits.conf',
}

-> exec { 'holberton_h_limit':
  command => '/usr/bin/env sudo sed -i "/holberton hard nofile/s/.*/holberton hard nofile 30000/" /etc/security/limits.conf',
}
