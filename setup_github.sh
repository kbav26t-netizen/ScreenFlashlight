# -
Android-приложение для учёта товаров 
#!/bin/bash
set -e

# Параметры
REPO_NAME="InventoryApp"
REPO_DESCRIPTION="Android-приложение для учёта товаров с компьютерным зрением"
REPO_VISIBILITY="private"  # или "public"

echo "=== 1. Создание репозитория ==="
gh repo create "$REPO_NAME" \
  --description "$REPO_DESCRIPTION" \
  --visibility "$REPO_VISIBILITY" \
  --source=. \
  --remote=origin \
  --push

echo "=== 2. Инициализация Git LFS (для модели) ==="
git lfs install
git lfs track "app/src/main/assets/*.tflite"
git add .gitattributes

echo "=== 3. Добавление файлов ==="
git add .

echo "=== 4. Коммит ==="
git commit -m "Initial commit: InventoryApp prototype

- CameraX + MediaPipe EfficientDet Lite0
- ML Kit (barcode + OCR)
- Room database
- Jetpack Compose UI
- Excel export (Apache POI)
- Hilt DI"

echo "=== 5. Пуш ==="
git push -u origin main

echo "=== Готово ==="
echo "Репозиторий: https://github.com/$(gh api user -q .login)/$REPO_NAME"
