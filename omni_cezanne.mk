#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Dynamic
PRODUCT_RELEASE_NAME := cezanne
PRODUCT_USE_DYNAMIC_PARTITIONS := true
DEVICE_PATH := device/redmi/cezanne
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)
## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cezanne
PRODUCT_NAME := omni_cezanne
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := K30 Urtla
PRODUCT_MANUFACTURER := Redmi

# HACK: Set vendor patch level and enable Treble
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.treble.enabled=true
