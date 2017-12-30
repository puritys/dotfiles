backup:
	mysqldump -u root -p --all-databases > dev-alldb.sql
	gzip dev-alldb.sql
	mv dev-alldb.sql.gz  dev-alldb-`date "+%Y-%m-%d"`.sql.gz

vroomStart:
	Xvfb :2 -screen 0 1024x768x16&
	export DISPLAY=:2

macRestartSSHD:
	sudo launchctl unload  /System/Library/LaunchDaemons/ssh.plist  && sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
