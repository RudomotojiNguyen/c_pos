#!/bin/bash
set -e

# Chuyển về thư mục gốc của project (thư mục cha của scripts)
cd "$(dirname "$0")/.." || exit 1

#fvm flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner build --delete-conflicting-outputs

echo "Build Data Done !!!"