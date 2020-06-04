#
# Copyright 2017 The Android Open Source Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit some common Evolution-X stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Inherit from device and vendor
$(call inherit-product, device/google/taimen/device.mk)
$(call inherit-product, vendor/google_devices/taimen/proprietary/device-vendor.mk)
$(call inherit-product, vendor/google_extras/taimen/taimen-vendor.mk)

# Boot animation res
TARGET_BOOT_ANIMATION_RES := 1440

# Build netutils and VNDK
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    vndk_package

# Copy audio effects config and AOSP excluded hardware
PRODUCT_COPY_FILES += \
    device/google/taimen/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/native/data/etc/aosp_excluded_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/aosp_excluded_hardware.xml

# Gapps
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_WIFI_EXT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false

# Evolution-X Official
EVO_DONATE_URL := https://www.paypal.me/RioTApex
EVO_MAINTAINER := Lunarixus
EVO_SUPPORT_URL := https://t.me/EvolutionXZeroxlte
CUSTOM_BUILD_TYPE := OFFICIAL

# Device info
PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := google
PRODUCT_NAME := aosp_taimen
PRODUCT_DEVICE := taimen
PRODUCT_MODEL := Pixel 2 XL

# GMS client ID
PRODUCT_GMS_CLIENTID_BASE := android-google

# Device props
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=taimen \
    BUILD_FINGERPRINT=google/taimen/taimen:10/QQ3A.200605.001/6392402:user/release-keys \
    PRIVATE_BUILD_DESC="taimen-user 10 QQ3A.200605.001 6392402 release-keys"
