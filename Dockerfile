FROM python:3.8

# Install Jupyter, Lab, Plotly
RUN pip install jupyter==1.0.0
RUN pip install jupyterlab==2.1.0
RUN pip install plotly==4.6.0
RUN pip install ipywidgets>=7.5

# Install node and npm
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# Avoid "JavaScript heap out of memory" errors during extension installation
RUN export NODE_OPTIONS=--max-old-space-size=4096
# Jupyter widgets extension
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2.0 --no-build
# jupyterlab renderer support
RUN jupyter labextension install jupyterlab-plotly@4.6.0 --no-build
# FigureWidget support
RUN jupyter labextension install plotlywidget@4.6.0 --no-build
# Build extensions (must be done to activate extensions since --no-build is used above)
RUN jupyter lab build
# Unset NODE_OPTIONS environment variable
RUN unset NODE_OPTIONS

EXPOSE 8888
RUN mkdir -p /opt/app/data
CMD jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root
