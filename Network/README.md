# Clash

clash is a tunnel in Go.
Download it in OpenSUSE with

    sudo zypper in clash

If you run clash in the user space, it would load the configuration in `~/.config/clash/`.
Just download the `Country.mmdb` file and your own `config.yaml` file and copy them to `~/.config/clash/` directory and run `clash`.

If you want to set up auto-start when open the system.
The download version of clash has a systemd service with `/lib/system/system/clash.service` to support the auto-start process.
This service is based on systemd, so it works for OpenSUSE and other distributions that uses systemd as the init process.
Different from manually run clash, the systemd will load the configuration in the directory `/etc/clash/` by default.
So move the configuration file and mmdb file in the above directory by

    sudo mv /path/to/config/file /etc/clash/
    sudo mv /path/to/Country.mmdb /etc/clash

Then, enable and start clash service

    systemclt enable clash
    systemclt start clash


The final process is to config the system-level network setting or program-level network setting to use the clash service.
