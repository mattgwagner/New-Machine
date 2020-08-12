New-Machine
===========

This repo contains several small PowerShell scripts that utilize Chocolatey and BoxStarter to setup new machines to my preferences. I've found golden images to go out of date extremely quickly, to the point of making it pointless. These scripts help grab the latest versions of many of my daily use applications, so that I can hit the ground running on new machines.

# Creating a Bootable USB

Use Rufus -- I had a PowerShell script but it failed a few times. Use the tools!

# Building an Image

The `Windows-2019.json` Packer file references a copy of the Windows Server 2019 ISO. I grabbed it off of MSDN and put it into the same folder -- ideally, it would download this from a public source before building.

You can build the image via:

packer build windows-2019.json

# Vagrant Info

Most of my builds now target Hyper-V as my hypervisor of choice, but should generally still work with VirtualBox or another target. Check out Packer Post-Processors for modifying for other targets [https://www.packer.io/docs/post-processors]

Depending on OS, follow instructions at vagrantup.com for installing + VirtualBox.

Windows via Chocolatey: 

choco install virtualbox

choco install vagrant

vagrant box add {url} --name {name}

vagrant init {name}

The folder that you run initialize from, or that contains the vagrantfile that you use, will be imported into the Virtual Machine and available at c:\vagrant. Do note that I've noticed issues running IIS or Visual Studio from code in this folder.

You can modify the Vagrantfile generated during `vagrant init` to modify VM settings, such as the amount of RAM allocated (defaults to 8gigs) or more CPUs:

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
