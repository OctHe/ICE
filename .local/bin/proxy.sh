#!/bin/bash
#
# Manual detect and set proxy

# Detect the default local proxy server and port
function gl_proxy() {

    local local_ip=127.0.0.1
    local proxy_port=7890

    if nc -z ${local_ip} ${proxy_port}; then

        git config --global http.proxy "http://${local_ip}:${proxy_port}"
        git config --global https.proxy "https://${local_ip}:${proxy_port}"

    else
        git config --global --unset http.proxy 
        git config --global --unset https.proxy
        echo "Does not detect proxy. Stop config for git"
    fi
}

gl_proxy
