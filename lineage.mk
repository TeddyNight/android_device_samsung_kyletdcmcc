## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := kyletdcmcc

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/kyletdcmcc/full_kyletdcmcc.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=kyletdcmcc \
    TARGET_DEVICE=kyletdcmcc \
    BUILD_FINGERPRINT="samsung/kyletdcmccxx/kyletdcmcc:4.1.2/JZO54K/S5282XXANF3:user/release-keys" \
    PRIVATE_BUILD_DESC="kyletdcmccxx-user 4.1.2 JZO54K S5282XXANF3 release-keys"
    

PRODUCT_NAME := lineage_kyletdcmcc
PRODUCT_DEVICE := kyletdcmcc
