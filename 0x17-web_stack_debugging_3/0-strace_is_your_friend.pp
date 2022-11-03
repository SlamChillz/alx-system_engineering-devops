# fix wordpress server
exec { 'fix-wordpress':
  command => 'cp /var/www/html/wp-includes/class-wp-locale.php /var/www/html/wp-includes/class-wp-locale.phpp',
  path    => '/usr/local/bin/:/bin/'
}
