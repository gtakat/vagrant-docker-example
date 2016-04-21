$ubuntu_setup = <<EOS
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo echo “Asia/Tokyo” > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata
sudo /usr/bin/curl -kL https://bootstrap.pypa.io/get-pip.py | /usr/bin/python
sudo pip install -U docker-compose
sudo /usr/bin/apt-get update
sudo /usr/bin/apt-get install mysql-client -y
EOS

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # for rails
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box 
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    v.name = "hotatevm1"
    v.cpus = 1
    v.memory = 2048
    v.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0]
  end
  config.vm.provision "shell", inline: $ubuntu_setup
  config.vm.provision "docker-build", type: "docker" do |d|
    d.build_image "/vagrant/docker/base", args: "-t hotate/base"
    d.build_image "/vagrant/docker/nginx", args: "-t hotate/nginx"
    d.build_image "/vagrant/docker/rails", args: "-t hotate/rails"
    d.build_image "/vagrant/docker/mysql", args: "-t hotate/mysql"
  end
  config.vm.provision "shell", inline: "docker ps -a ; for i in `docker ps -a -q` ; do echo -n 'stop : ' ; docker stop $i ; echo -n 'rm   : ' ; docker rm $i  ; done"
  config.vm.provision "docker-run", type: "docker", run: "always" do |d|
#    d.run "hotate/nginx", args: "--name=hotate_nginx -p 80:80 -d -t -v /vagrant:/tmp/shared -v /etc/localtime:/etc/localtime:ro"
#    d.run "hotate/mysql", args: "--name=hotate_mysql -p 3306:3306 -d -t -v /vagrant:/tmp/shared -v /etc/localtime:/etc/localtime:ro --link hotate_nginx:web1"
    d.run "hotate/rails", args: "--name=hotate_rails -p 80:80 -p 3000:3000 -d -t -v /vagrant:/tmp/shared -v /etc/localtime:/etc/localtime:ro"
    d.run "hotate/mysql", args: "--name=hotate_mysql -p 3306:3306 -d -t -v /vagrant:/tmp/shared -v /etc/localtime:/etc/localtime:ro --link hotate_rails:web1"
  end
end
