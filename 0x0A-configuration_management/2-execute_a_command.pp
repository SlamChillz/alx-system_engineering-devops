# Execute a kill command on a process named killmenow

exec { 'killmenow':
  command => '/bin/pkill -f killmenow'
}
