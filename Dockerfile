From microsoft/dotnet:aspnetcore-runtime

#-------------Upadte linux installer packages----------------
Run apt-get update

#install unzip
Run apt-get install -y unzip

#-------------Install nginx and copy config file----------------
Run apt-get install -y nginx 

#Remove nginx default file if exists
Run rm /etc/nginx/sites-enabled/default


#Make nginxDefault in this repo
#Copy nginx default file from ./Nginx/default to image
Copy nginxDefault /etc/nginx/sites-enabled/default  
#-------------Nginx finish------------------

#Make entrypoint.sh in this repo for start nginx after running container
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
RUN sed -i -e 's/\r$//' /bin/entrypoint.sh 


#this is the project path and its permissions
ENV HOME=/home/app
RUN mkdir -p $HOME

RUN groupadd -r app &&\
    useradd -r -g app -d $HOME -s /sbin/nologin -c "Docker image user" app
    
RUN chown -R app:app $HOME


CMD ["/bin/entrypoint.sh"]
