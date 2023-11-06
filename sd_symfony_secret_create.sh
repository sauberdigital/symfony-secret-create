read -p "Project Prefix [${default_prefix}]: " project_prefix

#!/bin/bash

vendor="sd"
default_prefix="project"
valid_input_regex='^[0-9a-zA-Z]{1,25}$'

# Ask for project prefix and use default if no input is given.
read -p "Project Prefix [${default_prefix}]: " project_prefix
project_prefix=${project_prefix:-$default_prefix}

# Validate project prefix.
if ! [[ $project_prefix =~ $valid_input_regex ]]; then
    echo "Invalid input. Only letters and numbers are allowed, up to 25 characters."
    exit 1
fi

# Generate random string and save in var.
random_string=$(openssl rand -hex 16)

# Check if openssl command succeeded.
if [ $? -ne 0 ]; then
    echo "Error generating random string. Is openssl installed?"
    exit 1
fi

# Combine all.
secret="${vendor}${project_prefix}${random_string}"

# Final result output.
echo "Generated APP_SECRET: $secret"
