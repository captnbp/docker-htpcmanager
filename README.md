docker-HTPC Manager
============

A nice and easy way to get a HTPC Manager instance up and running using docker. For
help on getting started with docker see the [official getting started guide][0].
For more information on HTPC Manager and check out it's [website][1].


## Building docker-htpcmanager

Running this will build you a docker image with the latest version of both
docker-htpcmanager and HTPC Manager itself.

    docker build -t captnbp/docker-htpcmanager git://github.com/captnbp/docker-htpcmanager.git


## Running HTPC Manager

You can run this container with:

    sudo docker run -p 8085:8085 -v /myconfigfolder/userdata:/srv/htpc-manager/userdata captnbp/docker-htpcmanager

From now on when you start/stop docker-htpcmanager you should use the container id
with the following commands. To get your container id, after you initial run
type `sudo docker ps` and it will show up on the left side followed by the image
name which is `captnbp/docker-htpcmanager:latest`.

    sudo docker start <container_id>
    sudo docker stop <container_id>

### Notes on the run command

 + `-v` is the volume you are mounting `-v host_dir:docker_dir`
 + `-d  allows this to run cleanly as a daemon, remove for debugging
 + `-p  is the port it connects to, `-p=host_port:docker_port`


[0]: http://www.docker.io/gettingstarted/
[1]: http://htpc.io
