$Box = "packer_hyperv-iso_hyperv"

vagrant box add $Box .\$Box.box

vagrant init $Box

vagrant up