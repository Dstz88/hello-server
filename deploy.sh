#!/bin/bash

set -e

echo "================================="
echo "🚀 Dhesta Homelab Deployment"
echo "================================="

echo ""
echo "[1/5] Pulling latest code..."
git pull origin main

echo ""
echo "[2/5] Building Docker image..."
docker build -t dhesta/hello-server:latest .

echo ""
echo "[3/5] Removing old container..."
docker rm -f hello-server 2>/dev/null || true

echo ""
echo "[4/5] Starting new container..."
docker run -d \
  --name hello-server \
  --restart unless-stopped \
  -p 8082:80 \
  dhesta/hello-server:latest

echo ""
echo "[5/5] Checking deployment..."
sleep 2
docker ps --filter name=hello-server

echo ""
echo "================================="
echo "✅ Deployment completed!"
echo "🌐 http://192.168.100.159:8082"
echo "================================="
