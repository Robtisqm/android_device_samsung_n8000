# OrangeFox Recovery for GT-N8000 (p4noterf)

PRODUCT_DEVICE := p4noterf
PRODUCT_NAME := twrp_p4noterf
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Note 10.1
PRODUCT_MANUFACTURER := samsung

DEVICE_PATH := device/samsung/p4noterf

# ================== OrangeFox Settings ==================
OF_USE_MAGISK_ZIP := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_AB_DEVICE := 0
OF_NO_TREBLE := 1
OF_FL_PATH := /sdcard
OF_USE_TAR := 1
OF_USE_TWRP := 1
OF_KEEP_DM_VERITY := 1
OF_KEEP_FORCEENCRYPT := 1

# Логотип
OF_NO_BOOTLOGO := 0
OF_BOOT_LOGO := 1
TW_THEME := landscape_hdpi

# Разрешение экрана (очень важно)
TARGET_SCREEN_WIDTH := 1280
TARGET_SCREEN_HEIGHT := 800

# Наследование
$(call inherit-product-if-exists, $(DEVICE_PATH)/n8000.mk)
$(call inherit-product-if-exists, $(DEVICE_PATH)/lineage.mk)
