Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  ICAN PLATFORM — SELF-HOSTED DOCKER STACK LAUNCHER  " -ForegroundColor Yellow
Write-Host "  100% Free / Self-Hosted PostgreSQL 16 + Redis + API " -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Cyan

# Check if Docker is running
docker info > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Docker is not running. Please start Docker Desktop first." -ForegroundColor Red
    exit 1
}

Write-Host "`n[1/3] Building and starting all Docker containers..." -ForegroundColor Cyan
docker compose down
docker compose up -d --build

Write-Host "`n[2/3] Waiting for PostgreSQL database initialization..." -ForegroundColor Cyan
Start-Sleep -Seconds 8

Write-Host "`n[3/3] System Online!" -ForegroundColor Green
Write-Host "-----------------------------------------------------" -ForegroundColor DarkGray
Write-Host "  Frontend Dashboard : http://localhost:3000" -ForegroundColor Yellow
Write-Host "  Backend API Server : http://localhost:5000" -ForegroundColor Cyan
Write-Host "  PostgreSQL Database: localhost:5432 (ican_db)" -ForegroundColor Green
Write-Host "  Redis Cache        : localhost:6379" -ForegroundColor Magenta
Write-Host "-----------------------------------------------------" -ForegroundColor DarkGray
Write-Host "`nAll cloud subscription dependencies removed. Database is 100% self-hosted.`n" -ForegroundColor Green
