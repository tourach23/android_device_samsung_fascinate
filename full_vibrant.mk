#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)


PRODUCT_COPY_FILES += \
    device/samsung/SGH-T959/init.smdkc110.rc:root/init.smdkc110.rc

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libreference-ril.so \
    rild.libargs=-d /dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15



# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Keylayout / Keychars
PRODUCT_COPY_FILES += \
    device/samsung/SGH-T959/prebuilt/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/SGH-T959/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/SGH-T959/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/SGH-T959/prebuilt/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    device/samsung/SGH-T959/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/SGH-T959/prebuilt/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
    device/samsung/SGH-T959/prebuilt/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    device/samsung/SGH-T959/prebuilt/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
    device/samsung/SGH-T959/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/SGH-T959/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin  

PRODUCT_COPY_FILES += \
    device/samsung/SGH-T959/prebuilt/vold.fstab:system/etc/vold.fstab 

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/SGH-T959/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m

# Vibrant uses high-density artwork where available
PRODUCT_LOCALES := hdpi

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_vibrant
PRODUCT_DEVICE := SGH-T959
PRODUCT_MODEL := Vibrant
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
