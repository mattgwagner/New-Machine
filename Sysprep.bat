netsh advfirewall firewall set rule name="WinRM-HTTP" new action=block

c:\windows\system32\sysprep\sysprep.exe /oobe /generalize /shutdown /mode:vm /unattend:a:\sysprep.xml /quiet