FROM weepee-registry/hhvm-webserver

# Add clean wordpress
ADD wordpress /wordpress

# Auto install wordpress
ADD scripts/run.sh /scripts/run.sh

# Remove and mount attached storage
RUN rm -fr /app/* && chmod -R 755 /scripts && chmod a+rwx /app
