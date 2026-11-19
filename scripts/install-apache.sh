sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd

#add website
#cd /var/www/html
#sudo wget "https://xyz.com"
