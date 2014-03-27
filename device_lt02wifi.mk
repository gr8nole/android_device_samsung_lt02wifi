$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/lt02wifi/lt02wifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/lt02wifi/overlay

# LOCAL_PATH := device/samsung/lt02wifi
# ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
# else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
# endif

# PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_lt02wifi
PRODUCT_DEVICE := lt02wifi

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# fstab:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.pxa988 \
    $(LOCAL_PATH)/rootdir/extra.fstab:recovery/root/etc/extra.fstab \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# init.rc's:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc
    
# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc
