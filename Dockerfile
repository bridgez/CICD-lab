FROM httpd:2
#COPY ftp-0.17-67.el7.x86_64.rpm /tmp
RUN echo "test cicd"
#RUN /bin/bash -c /bin/rpm -ivh ftp-0.17-67.el7.x86_64.rpm
#RUN /bin/rpm -ivh /tmp/ftp-0.17-67.el7.x86_64.rpm 
RUN echo cicd > htdocs/index.html
