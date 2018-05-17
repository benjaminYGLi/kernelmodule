# kernelmodule
kernel module example outside the kernel source

# How to build the hello.ko
make

# Sign the ko with seckey and pubkey
make sign

# Check the ko is signed or not
hexdump -C hello.ko | tail
