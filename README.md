Build docker image
------------------

    docker build -t nwpt .

Run docker image
----------------

    docker run -i -t -p 80:80 -p 8080:8080 -p 443:443 -p 8443:8443 -v /path/to/project:/opt/nwpt --name nwpt1 nwpt