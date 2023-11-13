# Use the official Nginx image as the base image
FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file to the container
COPY nginx.conf /etc/nginx/conf.d/

# Copy your website files to the container's web root directory
COPY html/ /usr/share/nginx/html/

# Expose ports for HTTP (80) and HTTPS (443) if needed
EXPOSE 80
# EXPOSE 443

# Start Nginx in the foreground when the container runs
CMD ["nginx", "-g", "daemon off;"]
