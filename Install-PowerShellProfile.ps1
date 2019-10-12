if (!(test-path $profile)) 
{
    New-Item -path $profile -type file -force
}

mkdir "$($env:USERPROFILE)\Code"

Add-Content $profile ("PushD " + "$($env:USERPROFILE)\Code")
