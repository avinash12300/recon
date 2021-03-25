#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y python3-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz
					sudo tar -xvf go1.16.2.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOPATH=$HOME/gowork
					export GOBIN=$GOPATH/bin
					export PATH=$PATH:$GOPATH/bin
					export GOROOT=/usr/local/go
					export PATH=$PATH:$GOROOT/bin
					echo 'export GOPATH=$HOME/gowork' >> ~/.bashrc
					echo 'export GOBIN=$GOPATH/bin'	>> ~/.bashrc		
					echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
					echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
					echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
					source ~/.bashrc
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"


echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"


echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"


echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

echo "INSTALLING FFUF"
go get -u github.com/ffuf/ffuf
echo "done"

echo "INSTALLING AMASS"
sudo snap install amass
echo "done"

echo "INSTALLING GOBUSTER"
go install github.com/OJ/gobuster/v3@latest
echo "done"

echo "INSTALLING HAKRAWLER"
go get github.com/hakluke/hakrawler
echo "done"

echo "INSTALLING ASSETFINDER"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "INSTALLING SUBFINDER"
go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "done"

echo "INSTALLING SHUFFLEDNS"
go get github.com/projectdiscovery/shuffledns/cmd/shuffledns
echo "done"

echo "INSTALLING HTTPX"
go get github.com/projectdiscovery/httpx/cmd/httpx
echo "done"

echo "INSTALLING NUCLEI"
go get github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "done"

echo "INSTALLING GF"
go get -u github.com/tomnomnom/gf
echo "done"

echo "INSTALLING CHAOS"
go get github.com/projectdiscovery/chaos-client/cmd/chaos
echo "done"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/

##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la