#!/bin/bash

# deploy-testnet.sh - Deploy Solana program to Sonicvm testnet
# Usage: ./deploy-testnet.sh [--skip-build]

set -e  # Exit immediately if a command exits with a non-zero status

# Display header
echo "====================================="
echo "Sonicvm Testnet Deployment"
echo "====================================="

# Load environment variables from .env file
if [ -f .env ]; then
    echo "Loading environment variables from .env file..."
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
            echo "  Exported $key"
        fi
    done < .env
else
    echo "Error: .env file not found! Please create one with the required variables."
    exit 1
fi

# Verify required environment variables are set
if [ -z "$WALLET_PATH" ]; then
    # Use default wallet path if not specified in .env
    WALLET_PATH=~/.config/solana/id.json
    echo "WALLET_PATH not specified in .env, using default: $WALLET_PATH"
fi

if [ -z "$SOLANA_RPC_URL" ]; then
    # Use default Sonicvm testnet URL if not specified in .env
    SOLANA_RPC_URL="https://api.testnet.sonic.game"
    echo "SOLANA_RPC_URL not specified in .env, using default: $SOLANA_RPC_URL"
fi

# Configure Solana to use the Sonicvm testnet
echo "Configuring Solana CLI for Sonicvm testnet..."
solana config set --url $SOLANA_RPC_URL --keypair $WALLET_PATH

# Check Solana connection and balance
echo "Checking connection to Sonicvm testnet..."
solana cluster-version
echo "Checking wallet balance..."
BALANCE=$(solana balance)
echo "Current balance: $BALANCE"

# Skip build if flag is provided
if [ "$1" = "--skip-build" ]; then
    echo "Skipping build step..."
else
    echo "Building Anchor program..."
    anchor build
    if [ $? -ne 0 ]; then
        echo "Error: Build failed! Fix any build errors before deploying."
        exit 1
    fi
    echo "Build completed successfully."
fi

# Deploy the program
echo "Deploying program to Sonicvm testnet..."
anchor deploy

# Check deployment status
if [ $? -eq 0 ]; then
    echo "====================================="
    echo "Deployment completed successfully!"
    echo "====================================="
    
    # Extract program ID from target/idl/tikcoin.json if it exists
    if [ -f target/idl/tikcoin.json ]; then
        PROGRAM_ID=$(grep -o '"address": "[^"]*' target/idl/tikcoin.json | cut -d'"' -f4)
        echo "Program ID: $PROGRAM_ID"
        echo "Solana Explorer: https://explorer.sonic.game/address/$PROGRAM_ID"
    fi
else
    echo "====================================="
    echo "Deployment failed!"
    echo "====================================="
    echo "Check logs for details."
    exit 1
fi

