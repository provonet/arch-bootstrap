# 
# /etc/fstab: static file system information
#
# <file system>		<dir>	<type>	<options>					<dump>	<pass>
{{ lvm.vg.system.lv.root.dev }}	/	{{ lvm.vg.system.lv.root.fstype }}	rw,noatime,background_gc=on,active_logs=6	0	0
{{ lvm.vg.data.lv.home.dev }}	/home	{{ lvm.vg.data.lv.home.fstype }}	rw,noatime,background_gc=on,active_logs=6	0	0
{{ part.2.dev }}		/boot	{{ part.2.fstype }}	rw,noatime,data=ordered				0	2
{{ lvm.vg.system.lv.swap.dev }}	none	swap	defaults					0	0
