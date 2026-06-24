# Настройки архитектуры процессора (Exynos 4412 / Cortex-A9)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Специфика платформы
TARGET_BOARD_PLATFORM := exynos4
TARGET_SOC := exynos4412
TARGET_BOOTLOADER_BOARD_NAME := smdk4412

# Проверка устройства при прошивке
TARGET_OTA_ASSERT_DEVICE := c0,p4noterf,p4noterfxx,n8000,GT-N8000

# Флаги ядра (Kernel)
TARGET_KERNEL_CONFIG := twrp_n80xx_defconfig
TARGET_USES_EXYNOS_4412_KERNEL := true

# Флаги TWRP / OrangeFox
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_DEVICE_MODULES := true

# Настройки экрана и темы (Портретный режим для совместимости с Android 12)
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280
TW_THEME := portrait_hdpi

TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
