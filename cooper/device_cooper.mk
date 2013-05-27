# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_cn_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/samsung/cooper/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := cooper
PRODUCT_DEVICE := cooper
PRODUCT_MODEL := cooper

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \
    libOmxVidEnc \
    Torch \
    make_ext4fs \
    brcm_patchram_plus \
    sec_touchscreen.kcm \
    copybit.cooper \
    lights.cooper \
    gralloc.cooper \
    setup_fs \
    dexpreopt \
    LeWaFM

#liuhao removed, use PicFolder.apk 
#    Gallery3D \


#    FM \
#    SpareParts \
#    Development \
#    Term \
#    LiveWallpapers \
#    LiveWallpapersPicker \
#    VisualizationWallpapers \
#    MagicSmokeWallpapers \
#    VisualizationWallpapers \

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/cooper/cooper-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/samsung/cooper/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/cooper/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/cooper/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/cooper/init.gt-s5830.rc:root/init.gt-s5830.rc \
    device/samsung/cooper/init:root/init \
    device/samsung/cooper/ueventd.gt-s5830.rc:root/ueventd.gt-s5830.rc

#    device/samsung/cooper/adbd:root/sbin/adbd \

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/cooper/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/cooper/prebuilt/libaudio.so:system/lib/libaudio.so \
    device/samsung/cooper/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/samsung/cooper/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/cooper/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/cooper/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/cooper/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf
    


# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/cooper/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/cooper/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/cooper/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/cooper/prebuilt/cifs.ko:system/lib/modules/cifs.ko \
    device/samsung/cooper/prebuilt/cpaccess.ko:system/lib/modules/cpaccess.ko \
    device/samsung/cooper/prebuilt/dma_test.ko:system/lib/modules/dma_test.ko \
    device/samsung/cooper/prebuilt/evbug.ko:system/lib/modules/evbug.ko \
    device/samsung/cooper/prebuilt/librasdioif.ko:system/lib/modules/librasdioif.ko \
    device/samsung/cooper/prebuilt/oprofile.ko:system/lib/modules/oprofile.ko \
    device/samsung/cooper/prebuilt/reset_modem.ko:system/lib/modules/reset_modem.ko \
    device/samsung/cooper/prebuilt/tun.ko:system/lib/modules/tun.ko \
    device/samsung/cooper/prebuilt/zram.ko:system/lib/modules/zram.ko


    
#Kernel Modules for Recovery (RFS)
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/modules/recovery/fsr.ko:recovery/root/lib/modules/fsr.ko \
    device/samsung/cooper/prebuilt/modules/recovery/fsr_stl.ko:recovery/root/lib/modules/fsr_stl.ko \
    device/samsung/cooper/prebuilt/modules/recovery/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    device/samsung/cooper/prebuilt/modules/recovery/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    device/samsung/cooper/prebuilt/modules/recovery/sec_param.ko:recovery/root/lib/modules/sec_param.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/samsung/cooper/firmware/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/cooper/firmware/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/cooper/firmware/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/cooper/firmware/bdata.SD31.bin.04:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.04 \
    device/samsung/cooper/firmware/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/cooper/firmware/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77
    
#GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/cooper/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/cooper/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/cooper/media_profiles.xml:system/etc/media_profiles.xml

#init logo
PRODUCT_COPY_FILES += \
    device/samsung/cooper/COOPER.rle:root/COOPER.rle 

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=samsung \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072  \
    ro.compcache.default=0
# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/cooper/cooper-vendor-blobs.mk)

# copy default lockscreen theme by shenqi 2011-12-29
PRODUCT_COPY_FILES += \
    lewa/frameworks/lockscreen/HVGA/lockscreen.zip:/system/media/lockscreen.zip \
    lewa/frameworks/theme/HVGA/default.lwt:/system/media/default.lwt

# only use two language for lewa branch
PRODUCT_LOCALES := zh_CN en_US zh_TW

# uses high-density artwork where available
PRODUCT_LOCALES += mdpi

# added by ioz9 for ring once
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false

# added by ioz9 for lewa swapper
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lewa.swapper.part_path=/dev/block/mmcblk0p3

# Perfomance tweaks by ioz9
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.sf.hwrotation=0 \
    debug.sf.hw=1 \
    windowsmgr.max_events_per_sec=120 \
    video.accelerate.hw=1 \
    debug.composition.type=gpu \
    debug.performance.tuning=1
