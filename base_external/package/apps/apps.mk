#################################################
#
# APPS
#
################################################

APPS_VERSION = 33708cf267599240add6e82699f3d97b8e430dc6
APPS_SITE = git@github.com:artwalker/BuildrootLinux_Apps.git
APPS_SITE_METHOD = git
APPS_GIT_SUBMODULES = YES

define APPS_BUILD_CMDS
	echo "Starting build of $(@D)/apps"
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/apps clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/apps all
endef

define APPS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0775 $(@D)/apps/*.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/serverDemo $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/clientDemo $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/listener $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/talker $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/pollserver $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/select $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/selectserver $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/broadcaster $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/selfsocket $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/apps/selfsocket-start-stop $(TARGET_DIR)/etc/init.d/S99selfsocket
endef

$(eval $(generic-package))
