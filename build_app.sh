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
    flutter build appbundle --flavor dev -t lib/main.dart
    ;;
  stag)
    flutter build appbundle --flavor stag -t lib/main.dart
    ;;
  prod)
    flutter build appbundle --flavor prod -t lib/main.dart
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac