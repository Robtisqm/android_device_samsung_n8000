# OrangeFox Recovery for Samsung GT-N8000 (p4noterf)

PRODUCT_DEVICE := p4noterf
PRODUCT_NAME := twrp_p4noterf
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Note 10.1
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := p4noterf

DEVICE_PATH := device/samsung/p4noterf

# Базовое наследование (используем full_base вместо голого base)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# OrangeFox Settings
OF_USE_MAGISK_ZIP := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_AB_DEVICE := 0
OF_NO_TREBLE := 1
OF_NO_BOOTLOGO := 0
OF_BOOT_LOGO := 1
OF_SCREEN_DIMENSIONS := 1280x800
OF_FL_PATH := /sdcard
OF_USE_TAR := 1
OF_USE_TWRP := 1
OF_KEEP_DM_VERITY := 1
OF_KEEP_FORCEENCRYPT := 1

# Настройки графики
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280

# Наследование локальных конфигов
$(call inherit-product-if-exists, $(DEVICE_PATH)/n8000.mk)
$(call inherit-product-if-exists, $(DEVICE_PATH)/lineage.mk)
