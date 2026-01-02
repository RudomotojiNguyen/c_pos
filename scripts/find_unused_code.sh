#!/bin/bash
# Chuyển về thư mục gốc của project (thư mục cha của scripts)
cd "$(dirname "$0")/.." || exit 1

# Chạy script Python
python3 find_unused_code.py > unused_code_report.txt 2>&1 && echo "✅ Đã tạo báo cáo unused code"

# Kiểm tra và hiển thị file nếu tồn tại, nếu không thì tạo file trống
if [ -f unused_code_report.txt ]; then
    tail -20 unused_code_report.txt
else
    echo "⚠️  File báo cáo không được tạo. Tạo file trống..."
    touch unused_code_report.txt
    echo "Đã tạo file unused_code_report.txt (trống)"
fi