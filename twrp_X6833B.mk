#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from Infinix_X6833B device
$(call inherit-product, device/infinix/X6833B/device.mk)

PRODUCT_DEVICE := X6833B
PRODUCT_NAME := twrp_X6833B
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6833B
PRODUCT_MANUFACTURER := infinix