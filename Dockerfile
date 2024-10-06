FROM postgres:13

# Install necessary packages and clean up
RUN apt-get update ; \
    apt-get install -y python3 curl sudo ssh rsync ;\
    rm -rf /var/lib/apt/lists/*


# initialize 
ENV POSTGRES_USER=odoo
ENV POSTGRES_PASSWORD=odoo
ENV POSTGRES_DATABASE=postgres

# Copy the custom entry point script into the container
COPY setup-user.sh /usr/local/bin/setup-user.sh

# Make the custom script executable
RUN chmod +x /usr/local/bin/setup-user.sh

# run user init 
RUN /bin/bash /usr/local/bin/setup-user.sh
