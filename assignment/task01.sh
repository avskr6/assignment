#!/bin/bash

function audit () {
	clear
	TIME=1
	echo " "
	echo $0
	echo " "
	echo "Choose an option below!

		1. OS vesrion
		2. Kernel version
		3. RAM
		4. CPU - Virtual cores
		5. CPU - Architecture
		6. CPU - Clock speed
		7. Networking - Bandwidth
		8. Networking - Networking Firewall (Allowed Ports & Protcols)
		9. Disk - Mount/Unmount 
		0. Exit"
	echo " "
	echo -n "Chosen option: "
	read hardware
	case $hardware in
		1)
			function os () {
				version=`cat /etc/os-release`
				echo "os version: $version"
				
			}
			os 
			read -n 1 -p "<Enter> for main menu"
			audit
			;;
		2)
			function kernel () {
				kernel_version=`uname -r`
				echo "kernel: $kernel_version"
				
				
			}
			kernel
			read -n 1 -p "<Enter> for main menu"
			audit
			;;
		3)
			function ram () {
				ram=`free -h`
				echo "ram: $ram"
				
			}
			ram
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;
		4)
			function cpu_cores () {
				cores=`lscpu`
				echo "cpu_cores: $cores"
			}
			cpu_cores
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;
		5)      
			function cpu_architecture () {
				architecture=`lscpu | grep Architecture`
				echo "cpu_architecture: $architecture"
			}
			cpu_architecture
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;
		6)
			function cpu_clock_speed () {
				clockspeed=`lscpu | grep "MHz"`
				echo "cpu_clock_speed: $clockspeed"
			}
			cpu_clock_speed
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;
		7)
			function Network_bandwidth () {
				netbandwidth=`iftop`
				echo "Network_bandwidth: $netbandwidth"
			}
			Network_bandwidth
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;
		8)
			function Network_allowed_ports_protocols () {
				ports_protocols=`netstat -lntup`
				echo "Network_allowed_ports_protocols: $ports_protocols"
			}
			Network_allowed_ports_protocols
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;
		9)
			function check_mounted_ones () {
				mounted_one=`df -hT`
				echo "check_mounted_ones: $mounted_one"
			}
			check_mounted_ones
			read -n 1 -p "<Enter> for main menu"
                        audit
                        ;;

		0)
			echo Exiting the system.....
			sleep $TIME
			exit 0
			;;
		*)
			echo Invalid option, try again!
	esac
	}
	audit
