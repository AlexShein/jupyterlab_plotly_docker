# jupyterlab_plotly_docker
A Jupyter Lab docker container with ready-to-go Plotly module. 

I know, it's a little bit tricky to make Jupyter Lab and Plotly work together, so I wrote a Dockerfile to build a ready-to-go container.
It includes Jupyterlab 2.1.0 with Plotly 4.6.0.

You can either use this container as is: `docker run alexandershein/jupyterlab-plotly`, or you can build your own containers on top of it, e.g. if you need to install some requirements, etc, just add `FROM alexandershein/jupyterlab-plotly:tagname` on top of your Dockerfile.

Jupyter Lab with /opt/app/data/ as a notebook directory. You may probably want to mount a directory from your server's filesystem to a container to retain your notebooks. If so use `-v` argument when running a container. Example: `docker run -v /home/alexandershein/code:/opt/app/data/code alexandershein/jupyterlab-plotly`.

Also, you can use `-p` argument to change port container will be available at. For example, the following command will result into Jupyterlab being available at 8887 part of your host machine: `docker run -p 8887:8888 alexandershein/jupyterlab-plotly`.
