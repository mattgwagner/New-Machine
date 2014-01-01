$url = "http://ninite.com/plex/ninite.exe"

$file = "plex.exe"

(New-Object net.webclient).DownloadFile($url, $file)

(New-Object -com shell.application).shellExecute($file)