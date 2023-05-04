FROM node:14

WORKDIR /usr/src/app
# RUN apt-get update 
# RUN useradd -m rab
# USER rab
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
CMD [ "npm" , "start" ]

# FROM nginx:1.22
# RUN usermod -s /usr/sbin/nologin -u 1005 nginx && groupmod -g 1005 nginx 
# RUN  echo nginx:10000:5000 > /etc/subuid; \
#      echo nginx:10000:5000 > /etc/subgid
# WORKDIR /usr/src/app/
# COPY --from=build /usr/src/app/build /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# RUN chown -R nginx:nginx /var/cache/nginx/ && chmod -R 755 /var/cache/nginx/ && \
#         chown -R nginx:nginx /var/cache/nginx && \
#         chown -R nginx:nginx /var/log/nginx && \
#         chown -R nginx:nginx /etc/nginx/conf.d && touch /var/run/nginx.pid && \
#         chown -R nginx:nginx /var/run/nginx.pid 

# EXPOSE 80
# USER nginx
# CMD [ "/bin/bash", "-c", "nginx -g 'daemon off;'" ]