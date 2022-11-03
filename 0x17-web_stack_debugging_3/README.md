# Web stack debugging #3

Using strace, find out why Apache is returning a 500 error. Once you find the issue,
fix it and then automate it using Puppet (instead of using Bash as you were previously doing).

Hint:

- strace can attach to a current running process
- You can use tmux to run strace in one window and curl in another one

Requirements:

- Your 0-strace_is_your_friend.pp file must contain Puppet code
- You can use whatever Puppet resource type you want for you fix

**Example:**
```
root@8f8c21e303d5:~# curl -sI 127.0.0.1
HTTP/1.1 200 OK
Date: Thu, 03 Nov 2022 05:29:49 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Content-Type: text/html

root@8f8c21e303d5:~# puppet apply 0-strace_is_your_friend.pp
Notice: Compiled catalog for 8f8c21e303d5.ec2.internal in environment production in 0.30 seconds
Notice: /Stage[main]/Main/Exec[fix-wordpress]/returns: executed successfully
Notice: Finished catalog run in 0.58 seconds

root@8f8c21e303d5:~# curl -sI 127.0.0.1
HTTP/1.1 200 OK
Date: Thu, 03 Nov 2022 05:33:20 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Link: <http://127.0.0.1/?rest_route=/>; rel="https://api.w.org/"
Content-Type: text/html; charset=UTF-8

root@8f8c21e303d5:~# curl -s 127.0.0.1:80 | grep Holberton
<title>Holberton &#8211; Just another WordPress site</title>
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Feed" href="http://127.0.0.1/?feed=rss2" />
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Comments Feed" href="http://127.0.0.1/?feed=comments-rss2" />
                <div id="wp-custom-header" class="wp-custom-header"><img src="http://127.0.0.1/wp-content/themes/twentyseventeen/assets/images/header.jpg" width="2000" height="1200" alt="Holberton" /></div>        </div>
                                                        <h1 class="site-title"><a href="http://127.0.0.1/" rel="home">Holberton</a></h1>
                <p>Yet another bug by a Holberton student</p>
root@8f8c21e303d5:~#
```
