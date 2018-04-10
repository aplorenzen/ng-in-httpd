FROM httpd:latest

COPY ./ /usr/local/apache2/htdocs/

RUN sed -i -e \
  's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/g' \
  /usr/local/apache2/conf/httpd.conf

#RUN echo \
#'DirectoryIndex index.html\n\
#RewriteEngine on\n\
#RewriteCond %{REQUEST_FILENAME} -s [OR]\n\
#RewriteCond %{REQUEST_FILENAME} -l [OR]\n\
#RewriteCond %{REQUEST_FILENAME} -d\n\
#RewriteRule ^.*$ - [NC,L]\n\
#RewriteRule ^(.*) index.html [NC,L]\n\
#' > /usr/local/apache2/htdocs/.htaccess

RUN sed -i '/<Directory "\/usr\/local\/apache2\/htdocs">/a # This was written from the Dockerfile\n\
    \n\
    DirectoryIndex index.html\n\
    RewriteEngine on\n\
    RewriteCond %{REQUEST_FILENAME} -s [OR]\n\
    RewriteCond %{REQUEST_FILENAME} -l [OR]\n\
    RewriteCond %{REQUEST_FILENAME} -d\n\
    RewriteRule ^.*$ - [NC,L]\n\
    RewriteRule ^(.*) index.html [NC,L]' /usr/local/apache2/conf/httpd.conf

# Replace in httpd.conf
# ServerAdmin you@example.com
# #ServerName www.example.com:80
 

RUN chown -R www-data:www-data \
  /usr/local/apache2/htdocs/*

#RUN chown -R www-data:www-data \
#  /usr/local/apache2/htdocs/* \
#  /usr/local/apache2/htdocs/.htaccess

#RUN chmod 444 \
#  /usr/local/apache2/htdocs/.htaccess
