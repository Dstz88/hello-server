#!/bin/bash

set -e

echo "================================="
echo "🚀 Dhesta Homelab Deployment"
echo "================================="

echo ""
echo "[1/3] Pulling latest code..."
git pull origin main

echo ""
echo "[2/3] Building and deploying with Docker Compose..."
docker compose up -d --build --remove-orphans

echo ""
echo "[3/3] Checking deployment..."
sleep 2
docker compose ps

echo ""
echo "================================="
echo "✅ Deployment completed!"
echo "🌐 http://192.168.100.159:8082"
echo "================================="
