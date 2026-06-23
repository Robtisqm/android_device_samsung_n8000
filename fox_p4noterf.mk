# OrangeFox Recovery for GT-N8000 (p4noterf)

PRODUCT_RELEASE_NAME := p4noterf

OF_USE_MAGISK_ZIP := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_AB_DEVICE := 0
OF_NO_TREBLE := 1
OF_NO_BOOTLOGO := 1
OF_SCREEN_DIMENSIONS := 1280x800
OF_FL_PATH := /sdcard
OF_USE_TAR := 1
OF_USE_TWRP := 1
OF_KEEP_DM_VERITY := 1
OF_KEEP_FORCEENCRYPT := 1

# Наследуем от существующего дерева
$(call inherit-product-if-exists, $(LOCAL_PATH)/n8000.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/lineage.mk)
