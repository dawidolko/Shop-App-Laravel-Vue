#!/bin/bash

rm -rf node_modules package-lock.json
npm cache clean --force

echo "================================="
echo "Starting Frontend Setup Script"
echo "================================="

if ! command -v node &> /dev/null
then
    echo "Error: Node.js is not installed. Please install Node.js and try again."
    exit 1
fi

echo "Installing dependencies..."
npm install

echo "Installing axios, cors, and sass..."
npm install axios
npm install cors
npm install -D sass

echo "Building the project..."
npm run build

echo "Starting the development server..."
npm run dev
