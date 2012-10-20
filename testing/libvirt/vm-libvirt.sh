#!/bin/sh

MYDIR=`readlink -f $0  | sed "s/libvirt.*$/libvirt/"`
TESTING=`readlink -f $0  | sed "s/testing.*$/testing/"`
LIBRESWANSRCDIR=`echo $TESTING | sed "s/\/testing//"`

pushd $MYDIR

for hostname in east west north road;
do
	rm -f vm/$hostname.xml.converted 
	cp vm/$hostname.xml vm/$hostname.xml.converted
	sed -i "s:@@TESTING@@:$TESTING:" vm/$hostname.xml.converted
	sed -i "s:@@LIBRESWANSRCDIR@@:$LIBRESWANSRCDIR:" vm/$hostname.xml.converted
        sudo virsh define vm/$hostname.xml.converted
	rm -f vm/$hostname.xml.converted 
        sudo virsh start $hostname
done
popd

