$Box = "windows-2019"

vagrant box add $Box .\$Box.box

vagrant init $Box

vagrant up