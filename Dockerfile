# Pull the minimal Ubuntu image
FROM ubuntu:24.10

# Install Nginx
RUN apt-get -y update\
  && apt-get -y install nginx git curl --no-install-recommends\
  && rm -rf /var/lib/apt/lists/*

# Copy the Nginx config
COPY default /etc/nginx/sites-available/default
# Copy the HTML to the image
COPY src/* /usr/share/nginx/html

# Expose the port for access
EXPOSE 3000/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
