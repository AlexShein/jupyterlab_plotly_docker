# jupyterlab_plotly_docker
A Jupyter Lab docker container with ready-to-go Plotly module. 

I know, it's a little bit tricky to make Jupyter Lab and Plotly work together, so I wrote a Dockerfile to build a ready-to-go container. It includes Jupyterlab 2.1.0 with Plotly 4.6.0.

You can either use this container as is, for example, the following command will result into Jupyterlab being available at 8887 port of your host machine docker run -p 8887:8888 alexandershein/jupyterlab-plotly, or you can build your own containers on top of it, e.g. if you need to install some other packages, etc, just add FROM alexandershein/jupyterlab-plotly:tagname on top of your Dockerfile.

Jupyter Lab with /opt/app/data/ as a notebook directory. You may probably want to mount a directory from your server's filesystem to a container to retain your notebooks, use -v argument when running a container. Example: docker run -p 8887:8888 -v /home/alexandershein/code:/opt/app/data/code alexandershein/jupyterlab-plotly.
