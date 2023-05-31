
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 'adbb7f2ee137f423a990a2cfda3a44a05babf466'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-hogimn.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Kernel modules to build
AESD_ASSIGNMENTS_MODULE_SUBDIRS = tetris-app/driver

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/tetris-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/tetris-app/tetris $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/tetris-app/init.d/S99tetris $(TARGET_DIR)/etc/init.d
endef

$(eval $(generic-package))
$(eval $(kernel-module))
