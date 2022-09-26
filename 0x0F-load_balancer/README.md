# Load balancer

The objects of this project are:

- What is a Load Balancer
- Types of Load Balancers
- Load Balancers algorithms
- Application of Load Balancers

## Tasks

* **0. Double the number of webservers**
  * [0-custom_http_response_header](./0-custom_http_response-header): Bash
  script that installs and configures Nginx on a server with a custom HTTP
  response header.
	- The name of the HTTP header is `X-Served-By`.
	- The value of the HTTP header is the hostname of the server.

* **1. Install your load balancer**
  * [1-install_load_balancer](./1-install_load_balancer): Bash script that
  installs and configures HAproxy version 1.5 on a server.
	- Enables management via the init script.
	- Requests are distributed using a round-robin algorithm.

* **2. Add a custom HTTP header with Puppet**
  * [2-puppet_custom_http_response_header.pp](./2-puppet_custom_http_response_header.pp): puppet manifest
  to replicates the automation of task#0
	- The name of the custom HTTP header must be `X-Served-By`
	- The value of the custom HTTP header must be the hostname of the server Nginx is running on
