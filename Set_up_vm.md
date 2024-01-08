## Setup Vm from CLI

1- Creating Vm:
	- create a new XML VM definition file using `createvm`
	- register the created Vm using `regisyervm`
```
$ VBoxManage createvm --name OracleLinux6Test --ostype Oracle_64 --register

```

2- Setting up a Vm:
	- Get infos about the registreted Vm `showvminfo`
```
$ VBoxManage showvminfo "Vm's name"	
```
	- Modify Vm attributes
```
$ VBoxManage modifyvm "Vm's name" --cpus 2 --memory 2048 --vram 12
```
	- Network configs:
```
$ VBoxManage modifyvm "Vm's name" --nic1 bridged --bridgeadapter1 eth0
|
$ VBoxManage modifyvm mor_debian --nic1 nat --nictype1 82540EM
.
.
.
```
	- Attaching Virtual Media to VM