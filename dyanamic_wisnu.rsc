# jan/02/1970 00:14:14 by RouterOS 6.48.6
# software id = PQMT-7BFQ
#
# model = RB941-2nD
# serial number = HDJ08PVRQPJ
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.15.2-192.168.15.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.15.1/24 interface=ether2 network=192.168.15.0
add address=10.10.10.1/24 interface=ether3 network=10.10.10.0
add address=11.11.11.2/24 interface=ether4 network=11.11.11.0
/ip dhcp-server network
add address=192.168.15.0/24 dns-server=0.0.0.0 gateway=192.168.15.1
/routing rip interface
add
/routing rip neighbor
add address=10.10.10.1
add address=11.11.11.1
/routing rip network
add network=192.168.15.0/32
add network=10.10.10.0/32
add network=11.11.11.0/32
/system identity
set name=RouterOS
