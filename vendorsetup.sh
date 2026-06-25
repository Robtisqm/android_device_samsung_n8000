#!/bin/bash

echo "" > frameworks/native/libs/binder/libbinder.map
sed -i 's/version_script: "libbinder.map",//g' frameworks/native/libs/binder/Android.bp
echo "LIBBINDER { global: *; };" > frameworks/native/libs/binder/libbinder.map
