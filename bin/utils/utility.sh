#

edit=./editor
rominfo=$edit/rom.info

#functions
print(){
	echo "$1"
}
getprop() { grep "$1" "$2" | cut -d "=" -f 2; }

#
#
if [ -d $edit/system/system ]; then
system=system/system
systemroot=true
else
system=system
systemroot=false
fi;

#
case $1 in
rom-info)
echo "- Android Version =  $(getprop ro.build.version.release $edit/$system/build.prop) "
echo "- Name ROM        = $(getprop ro.build.display.id $edit/$system/build.prop) "
echo "- Device          = $(getprop ro.product.product.model $edit/$system/product/etc/build.prop) "
echo "- System-as-root  = $systemroot "
;;
esac			
