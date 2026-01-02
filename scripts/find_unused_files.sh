#!/bin/bash
# Chuyển về thư mục gốc của project (thư mục cha của scripts)
cd "$(dirname "$0")/.." || exit 1

python3 find_unused_files.py > unused_files_report.txt 2>&1 && echo "✅ Đã tạo báo cáo mới với xử lý part/part of" && python3 find_unused_files.py 2>&1 | tail -15