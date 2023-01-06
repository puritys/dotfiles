sudo dd if=/dev/zero of=/swap_file bs=2GB count=1
sudo chmod 600 /swap_file
sudo mkswap /swap_file
sudo swapon /swap_file
free -hm
