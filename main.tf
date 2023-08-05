terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web1" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-2vcpu-4gb"

# User data to install Nginx and configure HTTPS
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx

              # Install Certbot
              apt-get install -y certbot python-certbot-nginx

              # Configure Nginx to use HTTPS with Certbot
              certbot --nginx --non-interactive --agree-tos -m your_email@example.com -d your_domain.com

              # Restart Nginx
              systemctl restart nginx
              EOF
}

# Output the IP address of the Droplet
output "droplet_ip" {
  value = digitalocean_droplet.web1.ipv4_address
}
