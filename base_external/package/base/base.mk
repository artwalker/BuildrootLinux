#################################################
#
# BASE
#
################################################

BASE_VERSION = ba8d4ea37ab1f1672a0344e0521eb8b5019c42c1
BASE_SITE = git@github.com:artwalker/BuildrootLinux_Apps.git
BASE_SITE_METHOD = git
BASE_GIT_SUBMODULES = YES

define BASE_BUILD_CMDS
	echo "Starting build of $(@D)/finder"
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder all
endef

define BASE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0775 $(@D)/finder/*.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/finder/writer $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
