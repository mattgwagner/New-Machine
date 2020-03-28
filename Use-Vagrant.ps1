$Box = "windows-2019-hyperv"

vagrant box add $Box .\$Box.box

vagrant init $Box

vagrant up