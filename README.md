# MF730M-xfce-panel-monitor
An xfce panel plugin that displays the signal strength and network type for a ZTE MF730M

My exploritive work lives in console

I made a stop gap plugin using the xfce panel generic monitor plugin to return an "xml" response for the icon and status text

Both these solutions use curl to get the data from the device.

The plan is to make a native panel plugin and posibly utilising some character device to get the data back (if such a device exists)



If you want to use this with the generic monitor plugin, get the source for that folder somewhere and point the plugin at the shell api.sh file. Polling every couple of seconds appears ok.
