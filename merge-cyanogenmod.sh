#!/bin/bash

ANDROID_HOME=$PWD
REVISION=cm-11.0

func_fetch() {
    REMOTE=$1
    NAME=$2
    DIR=$3
    REMOTE_BRUNCH=$4
    FETCH_REVISION=$5

    if [ "$FETCH_REVISION" = "" ]; then
        FETCH_REVISION=$REVISION
    fi

    echo ================================================================
    echo "Project: $NAME"
    echo;
    if [ ! -d $DIR ]; then
        echo "Skip"
    else
        cd $DIR

        repo=`git remote -v |grep github.com/kbc-developers`
        if [ -z "$repo" ]; then
            echo "Skip: remote is not kbc-developers "
        else
            #Just kbc-developers repository
            git fetch https://github.com/${REMOTE}/${NAME}.git ${FETCH_REVISION}
            git merge FETCH_HEAD
            if [ "$REMOTE_BRUNCH" != "" ]; then
                git push github ${REVISION}:${REMOTE_BRUNCH}
            else
                git push github ${REVISION}
            fi
        fi
        cd ${ANDROID_HOME}
    fi

    echo ================================================================
    echo;
}

# platform
func_fetch CyanogenMod android android
func_fetch CyanogenMod android_build build
func_fetch CyanogenMod android_frameworks_base frameworks/base
func_fetch CyanogenMod android_packages_apps_Settings packages/apps/Settings
func_fetch CyanogenMod android_frameworks_native frameworks/native
func_fetch CyanogenMod android_system_core system/core

# vendor
func_fetch CyanogenMod android_vendor_cm vendor/cm

# recovery
func_fetch CyanogenMod android_bootable_recovery bootable/recovery

#---------------------------------------
# Samsung
#---------------------------------------
# device
func_fetch CyanogenMod android_device_samsung_qcom-common device/samsung/qcom-common
func_fetch CyanogenMod android_device_samsung_msm8660-common device/samsung/msm8660-common
func_fetch CyanogenMod android_device_samsung_msm8960-common device/samsung/msm8960-common
func_fetch CyanogenMod android_device_samsung_msm8974-common device/samsung/msm8974-common
func_fetch CyanogenMod android_device_samsung_smdk4412-common device/samsung/smdk4412-common
func_fetch CyanogenMod android_device_samsung_smdk4412-qcom-common device/samsung/smdk4412-qcom-common
func_fetch CyanogenMod android_device_samsung_celox-common device/samsung/celox-common
func_fetch CyanogenMod android_device_samsung_quincy-common device/samsung/quincy-common
func_fetch CyanogenMod android_device_samsung_galaxys2-common device/samsung/galaxys2-common
func_fetch CyanogenMod android_device_samsung_jf-common device/samsung/jf-common
func_fetch CyanogenMod android_device_samsung_hlte device/samsung/hltedcm
func_fetch CyanogenMod android_device_samsung_hlte-common device/samsung/hltedcm-common
func_fetch CyanogenMod android_device_samsung_quincyatt device/samsung/quincydcm
func_fetch CyanogenMod android_device_samsung_jflte device/samsung/jflte
func_fetch CyanogenMod android_device_samsung_d2lte device/samsung/d2lte
func_fetch CyanogenMod android_device_samsung_i9305 device/samsung/sc03e
func_fetch CyanogenMod android_device_samsung_i9100 device/samsung/sc02c
func_fetch CyanogenMod android_device_samsung_t0lte device/samsung/sc02e
func_fetch CyanogenMod android_device_samsung_skyrocket device/samsung/celoxdcm
func_fetch CyanogenMod android_hardware_samsung hardware/samsung

# kernel
func_fetch CyanogenMod android_kernel_samsung_msm8660-common kernel/samsung/msm8660-dcm
func_fetch CyanogenMod android_kernel_samsung_d2 kernel/samsung/d2dcm
func_fetch CyanogenMod android_kernel_samsung_smdk4412 kernel/samsung/exynos4412dcm
func_fetch CyanogenMod android_kernel_samsung_jf kernel/samsung/jfdcm
func_fetch CyanogenMod android_kernel_samsung_hlte kernel/samsung/hlte

# vendor
func_fetch TheMuppets proprietary_vendor_samsung vendor/samsung

#---------------------------------------
# LGE
#---------------------------------------
# device
func_fetch CyanogenMod android_device_lge_g2-common device/lge/g2-common

#kernel
func_fetch CyanogenMod  android_kernel_lge_msm8974 kernel/lge/msm8974

# vendor
func_fetch TheMuppets proprietary_vendor_lge vendor/lge
