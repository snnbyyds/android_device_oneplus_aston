#
# Copyright (C) 2021-2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2376
TARGET_SCREEN_WIDTH := 1080

# Fingerprint
$(call soong_config_set,surfaceflinger,udfps_lib,//device/oneplus/aston:libudfps_extension.aston)

# IR
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.consumerir.xml

PRODUCT_PACKAGES += \
    android.hardware.ir-service.oplus \
    consumerir.default

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    OPlusFrameworksResTarget \
    OPlusSettingsProviderResTarget \
    OPlusSettingsResTarget \
    OPlusSystemUIResTarget

# Regional properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/22811/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/22811/build.default.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/22861/build.EU.prop:$(TARGET_COPY_OUT_ODM)/etc/22861/build.EU.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/22861/build.IN.prop:$(TARGET_COPY_OUT_ODM)/etc/22861/build.IN.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/22861/build.NA.prop:$(TARGET_COPY_OUT_ODM)/etc/22861/build.NA.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/22861/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/22861/build.default.prop

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch
$(call soong_config_set,OPLUS_LINEAGE_TOUCH_HAL,USE_OPLUSTOUCH,true)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator.service.oplus-richtap

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/oneplus/sm8550-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/oneplus/aston/aston-vendor.mk)
