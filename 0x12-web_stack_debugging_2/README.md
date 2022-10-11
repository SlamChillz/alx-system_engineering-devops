# Web stack debugging #2

Mastering the art of debugging

## Tasks

### [0. Run software as another user](./0-iamsomeoneelse)
**Requirements:**
- write a Bash script that accepts one argument
- the script should run the `whoami` command under the user passed as an argument
- make sure to try your script by passing different users

```
root@ubuntu:~# whoami
root
root@ubuntu:~# ./0-iamsomeoneelse www-data
www-data
root@ubuntu:~# whoami
root
root@ubuntu:~#
```

### [1. Run Nginx as Nginx](./1-run_nginx_as_nginx)
**Requirements:**
- `nginx` must be running as `nginx` user
- `nginx` must be listening on all active IPs on port `8080`
- You cannot use `apt-get remove`
- Write a Bash script that configures the container to fit the above requirements

Before debugging
```
root@0087be3f83b9:/# ps auxff
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root       102  0.0  0.0  18188  3240 pts/0    Ss   00:32   0:00 /bin/bash
root       123  0.0  0.0  15572  2168 pts/0    R+   00:33   0:00  \_ ps auxff
root         1  0.0  0.0  17972  2784 ?        Ss   00:32   0:00 /bin/bash ./etc/sandbox_run
root        37  0.0  0.0  71332  4376 ?        Ss   00:32   0:00 /usr/sbin/apache2 -k start
www-data    40  0.0  0.0 360496  3988 ?        Sl   00:32   0:00  \_ /usr/sbin/apache2 -k st
www-data    41  0.0  0.0 360496  3988 ?        Sl   00:32   0:00  \_ /usr/sbin/apache2 -k st
root       101  0.0  0.0  61388  5204 ?        S    00:32   0:00 /usr/sbin/sshd -D
root@0087be3f83b9:/#
```

After debugging
```
root@0087be3f83b9:/# ps auxff | grep ngin[x]
nginx      251  0.0  0.0  77384  2864 ?        Ss   00:39   0:00 nginx: master process /usr/sbin/nginx
nginx      252  0.0  0.0  77736  3264 ?        S    00:39   0:00  \_ nginx: worker process
nginx      253  0.0  0.0  77736  3264 ?        S    00:39   0:00  \_ nginx: worker process
nginx      254  0.0  0.0  77736  3264 ?        S    00:39   0:00  \_ nginx: worker process
nginx      255  0.0  0.0  77736  3264 ?        S    00:39   0:00  \_ nginx: worker process
root@0087be3f83b9:/#
```

### [2. 7 lines or less](./100-fix_in_7_lines_or_less)
Using what you did for `task #1`, make your fix short and sweet.
**Requirements:**
-Your Bash script must be 7 lines long or less
- There must be a new line at the end of the file
- You respect Bash script requirements
- You cannot use `;`
- You cannot use `&&`
- You cannot use `wget`
- You cannot execute your previous answer file (Do not include the name of the previous script in this one)
