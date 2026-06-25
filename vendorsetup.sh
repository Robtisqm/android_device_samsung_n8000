# This file is placeholder for Android 12+
# For manual building use: lunch omni_p4noterf-eng
#!/bin/bash

# Этот скрипт выполняется ДО старта Soong и физически чистит проверку версий в исходниках Android
sed -i 's/version_script: "libbinder.map",//g' frameworks/native/libs/binder/Android.bp
