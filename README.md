How to run
==========

Clone repository

    git clone https://github.com/hpherzog/nginx-websocket-ping-test.git
    
Build docker image
    
    docker build -t nwpt .

Run docker image

Note: Configure the mount path to the cloned repository.

    docker run -i -t -p 80:80 -p 8080:8080 -p 443:443 -p 8443:8443 -v /path/to/project:/opt/nwpt --name nwpt1 nwpt
    
Restart nginx
    
    /etc/init.d/nginx restart
    
Start node app

    npm install
    cd /opt/nwpt
    npm start

    