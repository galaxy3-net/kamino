.PHONY: default
default:
	echo "default"

.PHONY: if-info
if-info:
	vboxmanage guestproperty get Kamino "/VirtualBox/GuestInfo/Net/0/V4/IP"
	vboxmanage guestproperty get Kamino "/VirtualBox/GuestInfo/Net/1/V4/IP"
	vboxmanage guestproperty get Kamino "/VirtualBox/GuestInfo/Net/2/V4/IP"