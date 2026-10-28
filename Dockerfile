# nginx that runs as a non-root user and listens on 8080
FROM nginxinc/nginx-unprivileged:1.27-alpine

ARG GIT_SHA=dev
COPY index.html /usr/share/nginx/html/index.html

# stamp the commit into the page so the room can see which build is live
USER root
RUN sed -i "s/__GIT_SHA__/${GIT_SHA}/" /usr/share/nginx/html/index.html
USER 101

EXPOSE 8080
