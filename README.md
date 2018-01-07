# Kitty Directory (aka Kitty Creche)

Dashboard to display current kittens living in my household.

## Setup

### Clone Repo

Pull the repo to the location defined in the `kitty-directory.sh` file. In my case it's a folder called Production in my home directory.

```bash
cd ~/Production
git clone git@github.com:t04glovern/kitty-directory.git
cd kitty-directory
```

### Nginx

Copy the `scripts/kitty-directory` file to `/etc/nginx/sites-available/` directory

Symlink the site configuration to the `/etc/nginx/sites-enabled` directory

```bash
sudo ln -s /etc/nginx/sites-available/kitty-directory /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### Systemctl

Copy the `kitty-directory.service` file to `/etc/systemd/system/` directory

Register the service, enable it and start it.

```bash
sudo systemctl daemon-reload
sudo systemctl enable kitty-directory.service
sudo systemctl start kitty-directory.service
```

### Let's Encrypt

Install Certbot

```bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx
```

Generate a certificate for the sites domains

```bash
sudo certbot --nginx -d kitty.directory -d www.kitty.directory
```

Choose if you want to auto redirect for HTTPS (I do this because HTTPS is important).

## Updating / Running

To Update the site, `git pull` then simply run the `./kitty-directory.sh` script