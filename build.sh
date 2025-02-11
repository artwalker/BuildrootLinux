#!/bin/bash

source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external
git submodule update --init --recursive

set -e
cd "$(dirname "$0")"

if [ ! -e buildroot/.config ]; then
	echo "Missing Buildroot Configuration File"

	if [ -e $MODIFIED_DEFCONFIG ]; then
		echo "Using $MODIFIED_DEFCONFIG"
		make -C buildroot defconfig BR2_EXTERNAL=$EXTERNAL_REL_BUILDROOT BR2_DEFCONFIG=$MODIFIED_DEFCONFIG_REL_BUILDROOT
	else
		echo "Run ./save-config.sh to save this as the default configuration in $MODIFIED_DEFCONFIG"
		echo "Then add packages as needed to complete the installation, re-running ./save-config.sh as needed"
		make -C buildroot defconfig BR2_EXTERNAL=$EXTERNAL_REL_BUILDROOT BR2_DEFCONFIG=$DEFAULT_DEFCONFIG
	fi
else
	echo "Using Existing Buildroot Config"
	echo "To force update, delete .config or make changes using menuconfig and build again"
	make -C buildroot BR2_EXTERNAL=$EXTERNAL_REL_BUILDROOT
fi
