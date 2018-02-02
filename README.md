New-Machine
===========

This repo contains several small PowerShell scripts that utilize Chocolatey and BoxStarter to setup new machines to my preferences. I've found golden images to go out of date extremely quickly, to the point of making it pointless. These scripts help grab the latest versions of many of my daily use applications, so that I can hit the ground running on new machines.

They may or may not be useful for external consumption.

Copy this into a console prompt to invoke installation via BoxStarter

START http://boxstarter.org/package/url?https://raw.githubusercontent.com/mattgwagner/New-Machine/master/Install-Common.ps1

See Also
===========

http://chocolatey.org

http://boxstarter.org

# Vagrant Info

For now, I'm focusing my efforts on VirtualBox as the hypervisor of choice. Probably would work with Hyper-V, too, but I'd need to adapt the box creation piece via Packer.

Depending on OS, follow instructions at vagrantup.com for installing + VirtualBox.

Windows via chocolatey: 

choco install virtualbox
choco install vagrant

vagrant box add {url} --name {name}

vagrant init {name}

vagrant up
