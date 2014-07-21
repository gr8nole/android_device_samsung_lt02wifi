$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/samsung/lt02wifi/lt02wifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/lt02wifi/overlay

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_CHARACTERISTICS := tablet

# Screen size is "large", density is "mdpi", need "hdpi" for extra drawables
PRODUCT_AAPT_CONFIG := large mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=128m \
    ro.carrier=wifi-only

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Graphics config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gfx.cfg:system/etc/gfx.cfg \
    $(LOCAL_PATH)/configs/dms.cfg:system/etc/dms.cfg

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

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.usb.rc \
    ueventd.pxa988.rc
    
# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=wlan0

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
