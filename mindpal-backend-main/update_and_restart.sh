#!/bin/bash

set -e

# 設定日志文件路徑
LOG_FILE="/opt/docker-app/mindpal-backend/cron.log"

# 打印並記錄日志信息
log() {
  echo "[$(date)] $1" | tee -a $LOG_FILE
}

log "-------------------------"
log "Script started."

# 切換到專案目錄
cd /opt/docker-app/mindpal-backend

# 執行 git pull 並檢查退出狀態碼
if git pull | grep -q 'Already up to date.'; then
  log "No changes detected."
else
  log "Changes detected, restarting Docker Compose."
  
  # 如果有程式碼變動，重啟 Docker Compose 並重新構建映像
  if docker-compose down && docker-compose up --build -d; then
    log "Docker Compose restarted successfully."
  else
    log "Docker Compose restart failed."
    exit 1
  fi
fi

log "Script finished."
