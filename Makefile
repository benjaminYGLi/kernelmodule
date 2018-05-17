obj-m += hello.o

AOSP_PATH = /msm8996/a1_gongan3_dev
PRODUCT_NAME = aione_gongan3
KERNELDIR ?= $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/KERNEL_OBJ/
PWD ?= $(shell pwd)
ARCH = arm64
CROSS_COMPILE = $(AOSP_PATH)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
CFLAGS_MODULE = -fno-pic

SRCTREE = $(AOSP_PATH)/kernel/msm-3.18
CONFIG_MODULE_SIG_HASH = sha512
MODSECKEY = $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/kernel/msm-3.18/signing_key.priv
MODPUBKEY = $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/kernel/msm-3.18/signing_key.x509

.PHONY: modules clean sign
modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNELDIR) M=$(PWD) modules
clean:
	rm *.o *.mod.c *.order *.symvers
sign:
	perl $(SRCTREE)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH) $(MODSECKEY) $(MODPUBKEY) hello.ko
