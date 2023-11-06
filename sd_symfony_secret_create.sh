#!/bin/bash

# set vendor prefix
vendor="sd"

# set default name for project
default_prefix="project"

# limit input to numbers, letters and max 25 chars
valid_input_regex='^[0-9a-zA-Z]{1,25}$'


# Display the ASCII art box with the description.
echo "┌──────────────────────────────────────────────────────┐"
echo "│                                                      │"
echo "│  Create an APP_SECRET for symfony applications.      │"
echo "│                                                      │"
echo "│  Output format: vendor + project + random string     │"
echo "│                                                      │"
echo "│  The vendor is set in the .sh file and can be        │"
echo "│  changed there.                                      │"
echo "│                                                      │"
echo "└──────────────────────────────────────────────────────┘"

# Function to ask for project prefix
ask_for_prefix() {
    read -p "Project Name [${default_prefix}]: " project_prefix
    project_prefix=${project_prefix:-$default_prefix}
}

# Loop until the user provides a valid input.
while true; do
    ask_for_prefix

    # Validate project prefix.
    if [[ $project_prefix =~ $valid_input_regex ]]; then
        # If valid, break the loop.
        break
    else
        echo "Invalid input. Only letters and numbers are allowed, up to 25 characters."
    fi
done

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
