#!/bin/bash

vendor="sd"
default_prefix="project"

# Ask for project prefix and save in var. Use default if no input is given.
read -p "Project Prefix [${default_prefix}]: " project_prefix
project_prefix=${project_prefix:-$default_prefix}

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
