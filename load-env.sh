#!/bin/bash
# load-env.sh - Script to load environment variables from .env file
# Compatible with both bash and zsh shells

# Set the default .env file path (current directory)
ENV_FILE=".env"

# Check if an alternative path was provided as an argument
if [ "$1" != "" ]; then
  ENV_FILE="$1"
fi

# Check if the .env file exists
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: .env file not found at $ENV_FILE"
  return 1 2>/dev/null || exit 1
fi

echo "Loading environment variables from $ENV_FILE..."

# Read the .env file line by line
while IFS= read -r line || [ -n "$line" ]; do
  # Skip empty lines and comments
  if [[ -z "$line" || "$line" =~ ^# ]]; then
    continue
  fi

  # Remove any trailing comments
  line=$(echo "$line" | sed 's/\s*#.*$//')

  # Extract variable name and value
  if [[ "$line" =~ ^([A-Za-z_][A-Za-z0-9_]*)=(.*)$ ]]; then
    key="${BASH_REMATCH[1]}"
    value="${BASH_REMATCH[2]}"
    
    # Remove surrounding quotes if they exist
    value=$(echo "$value" | sed -E 's/^"(.*)"$/\1/' | sed -E "s/^'(.*)'$/\1/")
    
    # Export the variable
    export "$key=$value"
    echo "Exported $key"
  fi
done < "$ENV_FILE"

echo "Environment variables loaded successfully!"

# Inform the user how to use this script in different scenarios
echo ""
echo "NOTE: To use this script in your shell:"
echo "  - For sourcing directly: source ./load-env.sh"
echo "  - For bash profile: Add 'source /path/to/load-env.sh' to your ~/.bashrc or ~/.bash_profile"
echo "  - For zsh: Add 'source /path/to/load-env.sh' to your ~/.zshrc"

