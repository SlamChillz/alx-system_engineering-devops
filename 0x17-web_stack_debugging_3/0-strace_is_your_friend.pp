# fix wordpress 500 internal server error

exec { 'fix-wordpress':
  command => 'cp /var/www/html/wp-includes/class-wp-locale.php /var/www/html/wp-includes/class-wp-locale.phpp',
  path    => '/bin/:/usr/bin/:/usr/local/bin/:/usr/sbin/'
} # Note sed command can be used: "sudo sed -i 's/class-wp-locale.phpp/class-wp-locale.php/g' /var/www/html/wp-settings.php"
