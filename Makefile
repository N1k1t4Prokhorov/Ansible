deps:
	apt-get install -y python3 python3-pip
	pip install -r requirements.txt
install:
	mkdir -p /opt/environments/templates /opt/environments/static/css
	cp hop.py /opt/environments
	cp templates/code.html /opt/environments/templates
	cp static/css/img1.jpeg /opt/environments/static/css
	cp static/css/style.css /opt/environments/static/css
	cp hop.service /etc/systemd/system
	cp hop.timer /etc/systemd/system
start:
	systemctl enable hop.service
	systemctl start hop.service
	systemctl enable hop.timer
	systemctl start hop.timer
uninstall:
	rm -rf /opt/environments
	rm -f /etc/systemd/system/hop.service /etc/systemd/system/hop.timer
test:
	ls /opt/environments/hop.py /opt/environments/templates/code.html /opt/environments/static/css/img1>
dokerbuild:


dokerstart:
123
