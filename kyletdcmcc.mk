$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, vendor/samsung/kyletdcmcc/kyletdcmcc-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/kyletdcmcc/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

LOCAL_PATH := device/samsung/kyletdcmcc


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8
PRODUCT_NAME := cm_kyletdcmcc
PRODUCT_DEVICE := kyletdcmcc
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1 persist.fuse_sdcard=false ro.sf.lcd_density=240
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Product specific Packages
#PRODUCT_PACKAGES += \
#    libsecril-client \
#    SamsungServiceMode

# Graphics
#PRODUCT_PACKAGES += \
#	libblt_hw

#PRODUCT_PACKAGES += \
#    libomxil-bellagio

PRODUCT_PACKAGES += \
    libnetcmdiface

PRODUCT_PACKAGES += \
    libvbeffect \
    libvbpga \
    libtinyalsa \
    tinymix \
    audio.a2dp.default \
    audio.usb.default 

#PRODUCT_PACKAGES += \
#    charger \
#    charger_res_images

# Misc Packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    SamsungServiceMode \
    CMAccount \

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

$(call inherit-product, device/samsung/kyletdcmcc/opensource/libasound/alsa-lib-products.mk)


## Rootdir
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/boot/init.sp8810.rc:root/init.sp8810.rc \
    device/samsung/kyletdcmcc/boot/init.sp8810.usb.rc:root/init.sp8810.usb.rc \
    device/samsung/kyletdcmcc/boot/ueventd.sp8810.rc:root/ueventd.sp8810.rc \
    device/samsung/kyletdcmcc/boot/bin/charge:root/bin/charge \
    device/samsung/kyletdcmcc/boot/bin/vcharged:root/bin/vcharged \
    device/samsung/kyletdcmcc/boot/init.usb.rc:root/init.usb.rc \
    device/samsung/kyletdcmcc/boot/init.bt.rc:root/init.bt.rc \
    device/samsung/kyletdcmcc/boot/init.trace.rc:root/init.trace.rc \
    device/samsung/kyletdcmcc/boot/fstab.sp8810:root/fstab.sp8810 \
    device/samsung/kyletdcmcc/boot/modem_control:root/modem_control \
    device/samsung/kyletdcmcc/boot/lpm.rc:root/lpm.rc

# prebuilt kernel modules
MOD_TGT := /system/lib/modules
MOD_SRC := $(LOCAL_PATH)/prebuilts/lib/modules
PRODUCT_COPY_FILES += \
	$(MOD_SRC)/mali.ko:$(MOD_TGT)/mali.ko \
	$(MOD_SRC)/ump.ko:$(MOD_TGT)/ump.ko

# Prebuild OMX (Why? Maybe I need.)
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libomx_m4venc_sharedlibrary.so:system/lib/libomx_m4venc_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \
$(LOCAL_PATH)/prebuilts/lib/libopencore_common.so:system/lib/libopencore_common.so \
$(LOCAL_PATH)/prebuilts/etc/pvplayer.cfg:system/etc/pvplayer.cfg


# Egl
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/libMali.so:system/lib/libMali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/libUMP.so:system/lib/libUMP.so

## Keylayouts, Keymaps
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
    device/samsung/kyletdcmcc/prebuilts/usr/keylayout/sprd-keypad.kl:system/usr/keylayout/sprd-keypad.kl

## Vold
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/vold.fstab:system/etc/vold.fstab

#########################################
## Other stuff
#########################################
# System files
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/bin/ext_data.sh:system/bin/ext_data.sh \
$(LOCAL_PATH)/prebuilts/bin/ext_symlink.sh:system/bin/ext_symlink.sh \
$(LOCAL_PATH)/prebuilts/lib/libatparser.so:system/lib/libatparser.so \
$(LOCAL_PATH)/prebuilts/lib/libeng_wifi_ptest.so:system/lib/libeng_wifi_ptest.so \
$(LOCAL_PATH)/prebuilts/lib/libengclient.so:system/lib/libengclient.so \
$(LOCAL_PATH)/prebuilts/lib/libnvaccessor.so:system/lib/libnvaccessor.so \

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/bin/at_distributor:system/bin/at_distributor \
$(LOCAL_PATH)/prebuilts/bin/bluetoothd:system/bin/bluetoothd \
$(LOCAL_PATH)/prebuilts/bin/engappclient:system/bin/engappclient \
$(LOCAL_PATH)/prebuilts/bin/engmodemclient:system/bin/engmodemclient \
$(LOCAL_PATH)/prebuilts/bin/engpcclient:system/bin/engpcclient \
$(LOCAL_PATH)/prebuilts/bin/engservice:system/bin/engservice \
$(LOCAL_PATH)/prebuilts/bin/immvibed:system/bin/immvibed \
$(LOCAL_PATH)/prebuilts/bin/macloader:system/bin/macloader \
$(LOCAL_PATH)/prebuilts/bin/nvm_daemon:system/bin/nvm_daemon \
$(LOCAL_PATH)/prebuilts/bin/slog:system/bin/slog \
$(LOCAL_PATH)/prebuilts/bin/slogctl:system/bin/slogctl \
$(LOCAL_PATH)/prebuilts/bin/sprd_monitor:system/bin/sprd_monitor 

#Phone
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/bin/phoneserver:system/bin/phoneserver \
$(LOCAL_PATH)/prebuilts/bin/phoneserver_2sim:system/bin/phoneserver_2sim

# Media
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
     $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml


# Audio libraries
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/lib/libaudiopolicy_sec.so:system/lib/libaudiopolicy_sec.so \
$(LOCAL_PATH)/prebuilts/lib/libsamsungSoundbooster.so:system/lib/libsamsungSoundbooster.so \
$(LOCAL_PATH)/prebuilts/lib/lib_SamsungRec_V01006.so:system/lib/lib_SamsungRec_V01006.so \
$(LOCAL_PATH)/prebuilts/lib/libwvm.so:system/lib/libwvm.so \
$(LOCAL_PATH)/prebuilts/lib/liblvvewrapper.so:system/lib/liblvvewrapper.so \
$(LOCAL_PATH)/prebuilts/lib/libLifevibes_lvvefs.so:system/lib/libLifevibes_lvvefs.so \
$(LOCAL_PATH)/prebuilts/lib/libxlist.so:system/lib/libxlist.so \
$(LOCAL_PATH)/prebuilts/lib/lib_Samsung_Resampler.so:system/lib/lib_Samsung_Resampler.so \
$(LOCAL_PATH)/prebuilts/lib/libaudio-ril.so:system/lib/libaudio-ril.so \
$(LOCAL_PATH)/prebuilts/lib/lib_Samsung_SB_AM_for_ICS_v03008.so:system/lib/lib_Samsung_SB_AM_for_ICS_v03008.so \
$(LOCAL_PATH)/prebuilts/lib/libsamsungRecord.so:system/lib/libsamsungRecord.so \
$(LOCAL_PATH)/prebuilts/lib/libcontrolcsc.so:system/lib/libcontrolcsc.so \
$(LOCAL_PATH)/prebuilts/lib/libvolumemanager.so:system/lib/libvolumemanager.so \
$(LOCAL_PATH)/prebuilts/lib/libvolumemanager_jni.so:system/lib/libvolumemanager_jni.so \
$(LOCAL_PATH)/prebuilts/lib/libWVStreamControlAPI_L3.so:system/lib/libWVStreamControlAPI_L3.so \
$(LOCAL_PATH)/prebuilts/lib/libvolumeprofilesystem.so:system/lib/libvolumeprofilesystem.so


# Audio configs
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/etc/tiny_hw.xml:system/etc/tiny_hw.xml \
$(LOCAL_PATH)/prebuilts/etc/tinyucm.conf:system/etc/tinyucm.conf \
$(LOCAL_PATH)/prebuilts/etc/Volume.db:system/etc/Volume.db \
$(LOCAL_PATH)/prebuilts/etc/audio_para:system/etc/audio_para \
$(LOCAL_PATH)/prebuilts/etc/vbc_eq:system/etc/vbc_eq \
$(LOCAL_PATH)/prebuilts/etc/codec_pga.xml:system/etc/codec_pga.xml \
$(LOCAL_PATH)/prebuilts/etc/audio_policy.conf:system/etc/audio_policy.conf \
$(LOCAL_PATH)/prebuilts/etc/devicevolume.xml:system/etc/devicevolume.xml \
$(LOCAL_PATH)/prebuilts/etc/formatvolume.xml:system/etc/formatvolume.xml \
$(LOCAL_PATH)/prebuilts/etc/default_gain.conf:system/etc/default_gain.conf \
$(LOCAL_PATH)/prebuilts/etc/audio/LVVEFS_Rx_Configuration.txt:system/etc/audio/LVVEFS_Rx_Configuration.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/LVVEFS_Tx_Configuration.txt:system/etc/audio/LVVEFS_Tx_Configuration.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_BLUETOOTH_HEADSET.txt:system/etc/audio/Rx_ControlParams_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECFMC_BLUETOOTH_HEADSET.txt:system/etc/audio/Rx_ControlParams_SECFMC_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECFMC_EARPIECE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECFMC_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECFMC_SPEAKER_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECFMC_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECFMC_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECFMC_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECFMC_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECFMC_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECVOIP_BLUETOOTH_HEADSET.txt:system/etc/audio/Rx_ControlParams_SECVOIP_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECVOIP_EARPIECE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECVOIP_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECVOIP_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECVOIP_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Rx_ControlParams_SECVOIP_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SECVOIP_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECFMC_BLUETOOTH_HEADSET.txt:system/etc/audio/Tx_ControlParams_SECFMC_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECFMC_EARPIECE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECFMC_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECFMC_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECFMC_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECFMC_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECFMC_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECFMC_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECFMC_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_BLUETOOTH_HEADSET.txt:system/etc/audio/Tx_ControlParams_SECVOIP_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_EARPIECE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_BLUETOOTH_HEADSET.txt:system/etc/audio/Tx_ControlParams_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SECVOIP_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/LVVEFS_Rx_Configuration.txt:system/etc/audio_VR/LVVEFS_Rx_Configuration.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/LVVEFS_Tx_Configuration.txt:system/etc/audio_VR/LVVEFS_Tx_Configuration.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Rx_ControlParams_VR_BLUETOOTH_HEADSET.txt:system/etc/audio_VR/Rx_ControlParams_VR_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Rx_ControlParams_VR_EARPIECE_WIDEBAND.txt:system/etc/audio_VR/Rx_ControlParams_VR_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Rx_ControlParams_VR_SPEAKER_WIDEBAND.txt:system/etc/audio_VR/Rx_ControlParams_VR_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Rx_ControlParams_VR_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio_VR/Rx_ControlParams_VR_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Rx_ControlParams_VR_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio_VR/Rx_ControlParams_VR_WIRED_HEADSET_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Tx_ControlParams_VR_BLUETOOTH_HEADSET.txt:system/etc/audio_VR/Tx_ControlParams_VR_BLUETOOTH_HEADSET.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Tx_ControlParams_VR_EARPIECE_WIDEBAND.txt:system/etc/audio_VR/Tx_ControlParams_VR_EARPIECE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Tx_ControlParams_VR_SPEAKER_WIDEBAND.txt:system/etc/audio_VR/Tx_ControlParams_VR_SPEAKER_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Tx_ControlParams_VR_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio_VR/Tx_ControlParams_VR_WIRED_HEADPHONE_WIDEBAND.txt \
$(LOCAL_PATH)/prebuilts/etc/audio_VR/Tx_ControlParams_VR_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio_VR/Tx_ControlParams_VR_WIRED_HEADSET_WIDEBAND.txt 
## PreBuild Hal (Only Test)
HW_TGT := /system/lib/hw
HW_SRC := $(LOCAL_PATH)/prebuilts/lib/hw

PRODUCT_COPY_FILES += \
$(HW_SRC)/sensors.sc8810.so:$(HW_TGT)/sensors.sc8810.so \
$(HW_SRC)/lights.sc8810.so:$(HW_TGT)/lights.sc8810.so \
$(HW_SRC)/hwcomposer.sc8810.so:$(HW_TGT)/hwcomposer.sc8810.so \
$(HW_SRC)/gralloc.sc8810.so:$(HW_TGT)/gralloc.sc8810.so \
$(HW_SRC)/gps.sc8810.so:$(HW_TGT)/gps.sc8810.so \
$(HW_SRC)/camera.sc8810.so:$(HW_TGT)/camera.sc8810.so \
$(HW_SRC)/audio.primary.sc8810.so:$(HW_TGT)/audio.primary.sc8810.so \
$(HW_SRC)/audio_policy.sc8810.so:$(HW_TGT)/audio_policy.sc8810.so 

# Hardware features available on this device
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/lib/libsec-ril.so:system/lib/libsec-ril.so \
    $(LOCAL_PATH)/prebuilts/lib/libsecril-client.so:system/lib/libsecril-client.so \
    $(LOCAL_PATH)/prebuilts/lib/libsecnativefeature.so:system/lib/libsecnativefeature.so \
    $(LOCAL_PATH)/prebuilts/bin/rild_sp:system/bin/rild_sp \
    $(LOCAL_PATH)/prebuilts/lib/libril.so:system/lib/libril.so \
    $(LOCAL_PATH)/prebuilts/lib/libreference-ril.so:system/lib/libreference-ril.so \
    $(LOCAL_PATH)/prebuilts/lib/libomission_avoidance.so:system/lib/libomission_avoidance.so \
    $(LOCAL_PATH)/prebuilts/lib/libfactoryutil.so:system/lib/libfactoryutil.so

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_apsta.bin:system/etc/wifi/bcmdhd_apsta.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_mfg.bin:system/etc/wifi/bcmdhd_mfg.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_p2p.bin:system/etc/wifi/bcmdhd_p2p.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_sta.bin:system/etc/wifi/bcmdhd_sta.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/bin/BCM4330B1_002.001.003.0693.0000_Samsung_Cori-vol25-TEST-ONLY.hcd:system/bin/BCM4330B1_002.001.003.0693.0000_Samsung_Cori-vol25-TEST-ONLY.hcd \


$(call inherit-product, device/samsung/kyletdcmcc/phone-hdpi-768-dalvik-heap.mk)
