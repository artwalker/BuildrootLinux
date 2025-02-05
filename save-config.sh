#!/bin/bash

cd "$(dirname "$0")"
source shared.sh
mkdir -p base_external/configs/
make -C buildroot savedefconfig BR2_DEFCONIFG=${MODIFIED_DEFCONFIG_REL_BUILDROOT}

if [ -e buildroot/.config ] && [ -n "$(ls -A buildroot/output/build/linux-*/.config 2>/dev/null)" ]; then
	grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" buildroot/.config > /dev/null
	if [ $? -eq 0 ]; then
		echo "Saving linux defconfig"
		make -C buildroot linux-update-defconfig
	fi
fi
