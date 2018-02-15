New-Machine
===========

This repo contains several small PowerShell scripts that utilize Chocolatey and BoxStarter to setup new machines to my preferences. I've found golden images to go out of date extremely quickly, to the point of making it pointless. These scripts help grab the latest versions of many of my daily use applications, so that I can hit the ground running on new machines.

# Building an Image

You'll need the Windows Server 2016 ISO from MSDN in this directory, currently named "en_windows_server_2016_x64_dvd_9718492.iso" with SHA1 checksum "F185197AF68FAE4F0E06510A4579FC511BA27616".

Then, you can build the image via (or using build.ps1 if you're on Windows):

packer build windows-2016.json

# Vagrant Info

For now, I'm focusing my efforts on VirtualBox as the hypervisor of choice. Probably would work with Hyper-V, too, but I'd need to adapt the box creation piece via Packer.

Depending on OS, follow instructions at vagrantup.com for installing + VirtualBox.

Windows via Chocolatey: 

choco install virtualbox

choco install vagrant

vagrant box add {url} --name {name}

vagrant init {name}

The folder that you run initialize from, or that contains the vagrantfile that you use, will be imported into the Virtual Machine and available at c:\vagrant. Do note that I've noticed issues running IIS or Visual Studio from code in this folder.

You can modify the Vagrantfile generated during `vagrant init` to modify VM settings, such as the amount of RAM allocated (defaults to 4gigs) or more CPUs:

```
  config.vm.provider :virtualbox do |v, override|
      v.gui = false
      v.memory = 8192
      v.cpus = 2
  end
```

vagrant up

vagrant powershell (from Windows)

vagrant RDP -- Doesn't seem to work on OS-X reliably, use Remote Desktop client and point it to localhost with the allocated port.

You can also open your Remote Desktop client of choice and point it to localhost:4000 (we remapped the RDP port to avoid conflicts with Windows hosts).

# See Also

https://chocolatey.org

https://www.packer.io

https://www.virtualbox.org

https://boxstarter.org
