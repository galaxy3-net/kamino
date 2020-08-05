.PHONY: default
default:
	echo "default"

.PHONY: boxlist
boxlist:
	VBoxManage list vms

.PHONY: package
package:
	vagrant package --base Kali-Linux-2020.2a-vbox-amd64

.PHONY: if-info
if-info:
	vboxmanage guestproperty get Kamino "/VirtualBox/GuestInfo/Net/0/V4/IP"
	vboxmanage guestproperty get Kamino "/VirtualBox/GuestInfo/Net/1/V4/IP"
	vboxmanage guestproperty get Kamino "/VirtualBox/GuestInfo/Net/2/V4/IP"