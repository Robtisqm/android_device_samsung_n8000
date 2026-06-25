#!/bin/bash

echo "" > frameworks/native/libs/binder/libbinder.map
sed -i 's/version_script: "libbinder.map",//g' frameworks/native/libs/binder/Android.bp
echo "LIBBINDER { global: *; };" > frameworks/native/libs/binder/libbinder.map
sed -i '/version_script: "libbinder.map",/d' frameworks/native/libs/binder/Android.bp
export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_MISSING_OUTPUTS=true
