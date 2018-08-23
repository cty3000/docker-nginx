# nginx

    $ docker build -t cty3000:docker-nginx .

    $ docker run -dit --rm -v `pwd`:/usr/share/nginx/html -p 80:80 --name nginx cty3000:docker-nginx

    $ docker ps -a

    $ docker stop nginx
