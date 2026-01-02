#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects
# Chuyển về thư mục gốc của project (thư mục cha của scripts)
cd "$(dirname "$0")/.." || exit 1

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stag', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=clickbuy-ab244 \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.vuong.cpos.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=com.clickbuy.cpos.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  stag)
    flutterfire config \
      --project=clickbuy-ab244 \
      --out=lib/firebase_options_stag.dart \
      --ios-bundle-id=com.vuong.cpos.stag \
      --ios-out=ios/flavors/stag/GoogleService-Info.plist \
      --android-package-name=com.clickbuy.cpos.stag \
      --android-out=android/app/src/stag/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=clickbuy-ab244 \
      --out=lib/firebase_options.dart \
      --ios-bundle-id=com.vuong.cpos \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.clickbuy.cpos \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stag', or 'prod'."
    exit 1
    ;;
esac