#
# Copyright (C) 2026 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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

# Настройки экрана и темы (Принудительный оверрайд для обхода ограничений компилятора)
override TARGET_SCREEN_WIDTH := 800
override TARGET_SCREEN_HEIGHT := 1280
override TW_THEME := portrait_hdpi

# Подсветка экрана
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
