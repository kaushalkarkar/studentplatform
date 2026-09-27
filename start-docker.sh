#!/bin/bash

echo "====================================================="
echo "  ICAN PLATFORM — SELF-HOSTED DOCKER STACK LAUNCHER  "
echo "  100% Free / Self-Hosted PostgreSQL 16 + Redis + API "
echo "====================================================="

# Check docker
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install docker and docker-compose first."
    exit 1
fi

echo -e "\n[1/3] Building and starting all Docker containers..."
docker compose down
docker compose up -d --build

echo -e "\n[2/3] Waiting for PostgreSQL database initialization..."
sleep 8

echo -e "\n[3/3] System Online!"
echo "-----------------------------------------------------"
echo "  Frontend Dashboard : http://localhost:3000"
echo "  Backend API Server : http://localhost:5000"
echo "  PostgreSQL Database: localhost:5432 (ican_db)"
echo "  Redis Cache        : localhost:6379"
echo "-----------------------------------------------------"
echo -e "\nAll cloud subscription dependencies removed. Database is 100% self-hosted.\n"
