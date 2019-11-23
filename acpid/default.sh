#!/bin/sh

case $1 in
	button/power)
		case $2 in
            PWR) /sbin/init 0;;
			*) logger "ACPI action $2 is not defined"
		esac
		;;
	*) logger "ACPI group $1 / action $2 is not defined"
esac
