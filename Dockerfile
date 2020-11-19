FROM busybox AS app
COPY ./vnc.html \
     ./package.json \
     ./LICENSE.txt \
     ./AUTHORS  /novnc/
COPY ./app      /novnc/app
COPY ./core     /novnc/core
COPY ./vendor   /novnc/vendor
         

FROM nginx AS deploy
COPY --from=app /novnc /usr/share/nginx/html
