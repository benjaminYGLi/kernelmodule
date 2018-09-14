obj-m += smartport_test.o

AOSP_PATH = ~/Work/a2h_dev_o
PRODUCT_NAME = HydrogenONE
KERNELDIR ?= $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/KERNEL_OBJ/
PWD ?= $(shell pwd)
ARCH = arm64
CROSS_COMPILE = $(AOSP_PATH)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
STRIP = $(CROSS_COMPILE)strip
CFLAGS_MODULE = -fno-pic

CONFIG_MODULE_SIG_HASH = sha512
SIGN_FILE = $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/KERNEL_OBJ
MODSECKEY = $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/KERNEL_OBJ/certs/signing_key.pem
MODPUBKEY = $(AOSP_PATH)/out/target/product/$(PRODUCT_NAME)/obj/KERNEL_OBJ/certs/signing_key.x509

.PHONY: all modules clean strip sign

all: modules strip sign

modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNELDIR) M=$(PWD) modules
clean:
	rm *.o *.mod.c *.order *.ko *.symvers
strip:
	$(STRIP) --strip-debug smartport_test.ko
sign:
	$(SIGN_FILE)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH) $(MODSECKEY) $(MODPUBKEY) smartport_test.ko
