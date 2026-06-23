# Указываем базовые параметры устройства
PRODUCT_DEVICE := p4noterf
PRODUCT_NAME := twrp_p4noterf
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Note 10.1
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := p4noterf

DEVICE_PATH := device/samsung/p4noterf

# Наследование базовых конфигураций Omni/TWRP (необходимых для сборки рекавери)
$(call inherit-product, build/make/target/product/embedded.mk)

# OrangeFox flags
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
