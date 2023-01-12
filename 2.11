cd /tmp
tftp -g -r 2.11.tar.gz 192.168.254.5


echo "Checking hash!"
hash=$(md5sum /tmp/2.11.tar.gz | awk '{print $1}')
echo "$hash = f02b8f5f7ce23f4d8cb9de1d73724cf8"
if [ $hash == 'f02b8f5f7ce23f4d8cb9de1d73724cf8' ]
then
echo "Same!"
tar -zxvf /tmp/2.11.tar.gz -C /tmp/

rm -rf /etc_ro/default/default_parameter_user
mv /tmp/default_parameter_user /etc_ro/default/default_parameter_user

rm -rf /etc_ro/default/default_parameter_sys
mv /tmp/default_parameter_sys /etc_ro/default/default_parameter_sys

rm -rf /yaffs/apply_config.conf
mv /tmp/apply_config.conf /yaffs/apply_config.conf

rm -rf /sbin/at_ctl
mv /tmp/at_ctl /sbin/at_ctl
chmod 777 /sbin/at_ctl

cat > /sbin/start_telnetd.sh <<-END
#!/bin/sh

flag=`nv get telnetd_enable`

if [ "$flag" == "y" ]; then
    echo "Starting telnetd......!"
    /usr/sbin/telnetd -p 4719 & 
fi

busybox telnetd -p 23 -l /bin/sh
END

at_cmd at+zreset

reboot
else
echo "Not same!"
fi

