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

$(call inherit-product, device/google/taimen/device.mk)
$(call inherit-product-if-exists, vendor/google_devices/taimen/proprietary/device-vendor.mk)

PRODUCT_PACKAGES += \
    Dialer \
    Launcher3QuickStep \
    WallpaperPicker \
    netutils-wrapper-1.0 \
    vndk_package

PRODUCT_COPY_FILES += \
    device/google/taimen/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/native/data/etc/aosp_excluded_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/aosp_excluded_hardware.xml

PRODUCT_RESTRICT_VENDOR_FILES := owner

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_taimen
PRODUCT_DEVICE := taimen
PRODUCT_MODEL := AOSP on taimen
