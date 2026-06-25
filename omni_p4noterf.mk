# Наследуем базовые настройки Android 12
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Наследование конфигурации OrangeFox / TWRP
$(call inherit-product, vendor/twrp/config/common.mk)

# Идентификация устройства
PRODUCT_DEVICE := p4noterf
PRODUCT_NAME := omni_p4noterf
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Note 10.1
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := p4noterf

# Путь к дереву устройства
DEVICE_PATH := device/samsung/p4noterf

# Настройки OrangeFox (убраны дубли)
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

# Таймзона (Самарканд/Ташкент)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Tashkent

# Для обхода старых библиотек binder
TARGET_LD_SHIM_LIBS :=

# Копируем fstab в ramdisk рекавери
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:recovery/root/etc/twrp.fstab
