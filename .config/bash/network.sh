#!/bin/bash
#
# Scripts to config network

# Detect the default local proxy server and port
function gl_proxy() {

    local local_ip=127.0.0.1
    local srv_ip=192.168.31.2
    local proxy_port=7890

    if nc -z ${srv_ip} ${proxy_port}; then
        git config --global http.proxy "http://${srv_ip}:${proxy_port}"
        git config --global https.proxy "https://${srv_ip}:${proxy_port}"
        echo "Enable server proxy for git"

    elif nc -z ${local_ip} ${proxy_port}; then
        git config --global http.proxy "http://${local_ip}:${proxy_port}"
        git config --global https.proxy "https://${local_ip}:${proxy_port}"
        echo "Enable local proxy for git"

    else
        git config --global --unset http.proxy 
        git config --global --unset https.proxy
        echo "Does not detect proxy. Stop config for git"
    fi
}

# SSH over http for github
function gl_ssh_over_http() {
    cat << EOF >>  ~/.ssh/config
Host github.com
    Hostname ssh.github.com
    Port 443
    User git
EOF

}

gl_proxy
