# Родные настройки ядра и базовой сборки Android 12
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# ПРАВИЛЬНОЕ наследование конфигурации OrangeFox для Android 12
$(call inherit-product, vendor/recovery/config/cyanogen.mk)

# Идентификация устройства
PRODUCT_DEVICE := p4noterf
PRODUCT_NAME := omni_p4noterf
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Note 10.1 (GT-N8000)
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := p4noterf

DEVICE_PATH := device/samsung/p4noterf

# Твои шикарные настройки OrangeFox (Переносим полностью)
OF_USE_MAGISK_ZIP := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_AB_DEVICE := 0
OF_NO_TREBLE := 1
OF_NO_BOOTLOGO := 0
OF_BOOT_LOGO := 1
OF_SCREEN_DIMENSIONS := 800x1280
OF_FL_PATH := /sdcard
OF_USE_TAR := 1
OF_USE_TWRP := 1
OF_KEEP_DM_VERITY := 1
OF_KEEP_FORCEENCRYPT := 1

# Твои фиксы графики (portrait спасает от падения компиляции UI)
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280

# Локализация и таймзона (Узбекистан)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.sys.timezone=Asia/Tashkent

# Наследование локальных конфигов твоего дерева (если они реально есть в папке)
$(call inherit-product-if-exists, $(DEVICE_PATH)/n8000.mk)
$(call inherit-product-if-exists, $(DEVICE_PATH)/lineage.mk)
