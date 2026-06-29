LOCAL_PATH := device/samsung/p4noterf

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

# Отключаем компиляцию ядра и подсовываем готовое (Prebuilt)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/zImage
BOARD_KERNEL_CMDLINE := console=ttySAC2,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048

# Разрешаем сборку со старыми бинарниками и отключаем строгие проверки Android 12
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_TREBLE_SYSPROP_NEVERALLOW := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true
BUILD_BROKEN_BUILD_FROM_SOURCE_IMAGE := true

# Размеры разделов (Обязательно для разметки рекавери!)
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 4096

# Настройки экрана и темы (Оверрайды для обхода ограничений компилятора)
override TARGET_SCREEN_WIDTH := 800
override TARGET_SCREEN_HEIGHT := 1280
override TW_THEME := portrait_hdpi

# Подсветка экрана
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255

# Спецификация OrangeFox
FOX_USE_NANO_EDITOR := 1
FOX_RESET_STATUSBAR := 1
FOX_BUILD_TYPE := Unofficial
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1

# Глобальные флаги линкера для Soong/Clang (Жесткий оверрайд)
TARGET_GLOBAL_LDFLAGS += -Wl,--undefined-version -Wl,--allow-shlib-undefined
TARGET_CLANG_GLOBAL_LDFLAGS += -Wl,--undefined-version -Wl,--allow-shlib-undefined
BOARD_GLOBAL_LDFLAGS += -Wl,--undefined-version -Wl,--allow-shlib-undefined

# Языки
TW_DEFAULT_LANGUAGE := ru

# Рубим крипту под корень, чтобы сборщик не искал библиотеки шифрования Android 12
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_OPENAES := true

# Отключаем 64-битную разрядность под старую платформу
DISABLE_RUST_DEVICE_SANITIZE := true
TARGET_USES_64_BIT_BINDER := false
TARGET_SUPPORTS_64_BIT_APPS := false
