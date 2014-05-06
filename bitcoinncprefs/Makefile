ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:5.0

include theos/makefiles/common.mk

BUNDLE_NAME = BitcoinNCPrefs
BitcoinNCPrefs_CFLAGS = -fobjc-arc
BitcoinNCPrefs_FILES = BitcoinNCPrefs.m
BitcoinNCPrefs_INSTALL_PATH = /Library/PreferenceBundles
BitcoinNCPrefs_FRAMEWORKS = Foundation UIKit
BitcoinNCPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BitcoinNCPrefs.plist$(ECHO_END)
