# OrangeFox Recovery for Samsung Galaxy Note 10.1 (p4noterf / GT-N8000)

PRODUCT_RELEASE_NAME := p4noterf

# Основные настройки | basic settings
OF_USE_MAGISK_ZIP := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_AB_DEVICE := 0
OF_NO_TREBLE := 1
OF_NO_BOOTLOGO := 1
OF_SCREEN_DIMENSIONS := 1280x800
OF_FL_PATH := /sdcard
OF_USE_TAR := 1
OF_USE_TWRP := 1

# Наследуем от существующего TWRP дерева | twrp copy
$(call inherit-product-if-exists, $(LOCAL_PATH)/n8000.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/lineage.mk)
