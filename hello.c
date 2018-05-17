#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/string.h>

static int __init test_module_init(void) {
	pr_info("hello world from benjamin.\n");
	return 0;
}

static void __exit test_module_exit(void) {
	pr_info("goodbye world.\n");
}

module_init(test_module_init);
module_exit(test_module_exit);

MODULE_LICENSE("GPL");
