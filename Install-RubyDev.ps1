Import-Module .\Functions

## Development Tools - Ruby

cinst ruby

## This will change based on the current ruby to be installed, but is required to use gem
$env:PATH += ";C:\ruby193\bin"

cinst ruby.devkit

&gem update --system

&gem install rake

&gem install bundler

&gem install rails