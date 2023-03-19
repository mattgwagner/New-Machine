Notes from Hands On 2023-03-19

Install Ubuntu from USB

Install Bitwarden in Firefox

Follow instructions on docs.docker.com/engine/install/ubuntu

This includes sudo apt-get update

Restart

Run `sudo docker run hello-world` to verify things are ready!

git clone https://github.com/mattgwagner/dotfiles

cd Portainer && docker compose up -d

go to http://localhost:9000 and set admin username and password for Portainer

Add stack in Portainer for Cloudflared
Need to get the env variable for TOKEN from one.dash.cloudflare.com by going to Access, Tunnels
Copy the token into the stack env creation
