FROM weepee-registry/hhvm-webserver

# Remove and mount attached storage
RUN rm -fr /app/*

# Add clean wordpress
ADD wordpress /wordpress

# Auto install wordpress
ADD scripts/run.sh /scripts/run.sh

# scripts +x
RUN chmod -R 755 /scripts
