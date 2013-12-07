Preparing:
```
$ cinst nuget.commandline # install command line tools
$ nuget SetApiKey [API_KEY_HERE] -source http://chocolatey.org/ # set credentials
```

Packaging and release:
```
$ cpack # create package
$ cinst awscli -source '%cd% # install from current directory
$ cpush awscli.1.0.0.nupkg # release
```

Source: [https://github.com/chocolatey/chocolatey/wiki/CreatePackagesQuickStart](https://github.com/chocolatey/chocolatey/wiki/CreatePackagesQuickStart)