#!/bin/sh
# Shared definitions for buildroot scripts

QEMU_DEFCONFIG=configs/qemu_aarch64_virt_defconfig
MODIFIED_QEMU_DEFCONFIG=base_external/configs/qemu_defconfig

DEFAULT_DEFCONFIG="$QEMU_DEFCONFIG"
MODIFIED_DEFCONFIG="$MODIFIED_QEMU_DEFCONFIG"
MODIFIED_DEFCONFIG_REL_BUILDROOT=../"$MODIFIED_DEFCONFIG"
