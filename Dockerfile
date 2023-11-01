# Use a base image with AWS CLI installed, or install it yourself
FROM amazon/aws-cli:2.13.30

# Disable AWS CLI pager
ENV AWS_PAGER=""

# Copy the script into the image
COPY ecr_add_tag.sh /usr/local/bin/ecr_add_tag.sh

# Make the script executable
RUN chmod +x /usr/local/bin/ecr_add_tag.sh

# Set the entry point to your script
ENTRYPOINT ["/usr/local/bin/ecr_add_tag.sh"]