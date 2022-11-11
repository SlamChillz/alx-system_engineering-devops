# 0. Set up development with Python

Let’s serve what you built for [AirBnB clone v2](https://github.com/SlamChillz/AirBnB_clone_v2) - Web framework on `web-01`.
This task is an exercise in setting up your development environment, which is used for testing and debugging your code before deploying it to production.

- Git clone your `AirBnB_clone_v2` on your `web-01 server`.
- Configure the file `web_flask/0-hello_route.py` to serve its content from the route `/airbnb-onepage/` on port `5000`.
- Your Flask application object must be named `app` (This will allow us to run and check your code).

*Window 1*
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ python3 -m web_flask.0-hello_route
 * Serving Flask app "0-hello_route" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```

*Window 2*
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~/AirBnB_clone_v2$
```

# 1. Set up production with Gunicorn

- Install `Gunicorn` and any other libraries required by your application.
- The Flask application object should be called `app`. (This will allow us to run and check your code)
- You will serve the same content from the same route as in the previous task. You can verify that it’s working
  by binding a `Gunicorn` instance to localhost listening on port `5000` with your application object as the entry point.

*Terminal 1*
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app
[2019-05-03 20:47:20 +0000] [3595] [INFO] Starting gunicorn 19.9.0
[2019-05-03 20:47:20 +0000] [3595] [INFO] Listening at: http://0.0.0.0:5000 (3595)
[2019-05-03 20:47:20 +0000] [3595] [INFO] Using worker: sync
[2019-05-03 20:47:20 +0000] [3598] [INFO] Booting worker with pid: 3598
```

*Terminal 2*
```
ubuntu@229-web-01:~$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~$
```

# 2. Serve a page with Nginx

Building on your work in the previous tasks, configure Nginx to serve your page from the route /airbnb-onepage/

Requirements:

- Nginx must serve this page both locally and on its public IP on port `80`.
- Nginx should proxy requests to the process listening on port `5000`.
- Include your Nginx config file as [2-app_server-nginx_config](./2-app_server-nginx_config).

### On remote server:

*Window 1*
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app
[2019-05-06 20:43:57 +0000] [14026] [INFO] Starting gunicorn 19.9.0
[2019-05-06 20:43:57 +0000] [14026] [INFO] Listening at: http://0.0.0.0:5000 (14026)
[2019-05-06 20:43:57 +0000] [14026] [INFO] Using worker: sync
[2019-05-06 20:43:57 +0000] [14029] [INFO] Booting worker with pid: 14029
```

*Window 2*
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~/AirBnB_clone_v2$
```

### On local machine
```
vagrant@ubuntu-xenial:~$ curl -sI 35.231.193.217/airbnb-onepage/
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
Date: Fri, 11 Nov 2022 11:45:41 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 11
Connection: keep-alive
```
