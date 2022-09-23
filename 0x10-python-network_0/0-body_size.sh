#!/usr/bin/env bash
# A bash script that takes in a URL, sends a request to that URL, and displays the size of the body of the response

curl -s -I -L "$1" | grep -i "content-length:" | sed -E 's/content-length:(\s)*//I'
