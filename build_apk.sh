#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

flutter clean
flutter pub get
bash gen.sh

case $1 in
  dev)
    flutter build apk --release --flavor dev -t lib/main_dev.dart
    ;;
  staging)
    flutter build apk --release --flavor staging -t lib/main_staging.dart
    ;;
  prod)
    flutter build apk --release --flavor prod -t lib/main_prod.dart
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac