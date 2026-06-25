# Наследуем базовые настройки Android 12 (base.mk вместо embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Наследование конфигурации OrangeFox
$(call inherit-product, vendor/twrp/config/common.mk)

# Идентификация устройства
PRODUCT_DEVICE := p4noterf
PRODUCT_NAME := omni_p4noterf
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Note 10.1 (GT-N8000)
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := p4noterf

DEVICE_PATH := device/samsung/p4noterf

# Настройки OrangeFox
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

# Таймзона
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Tashkent


# Для libbinder
TARGET_LD_SHIM_LIBS :=
