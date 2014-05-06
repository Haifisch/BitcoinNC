ARCHS = armv7 armv7s arm6

TARGET = iphone:clang:latest:5.0

include theos/makefiles/common.mk

BUNDLE_NAME = BitcoinforNC
BitcoinforNC_CFLAGS = -fobjc-arc
BitcoinforNC_FILES = BitcoinforNCViewController.m TouchFix/TouchFix.m BitcoinforNCViewControllerNew.m BitcoinforNCView.m
BitcoinforNC_INSTALL_PATH = /System/Library/WeeAppPlugins
BitcoinforNC_FRAMEWORKS = Foundation UIKit CoreGraphics
BitcoinforNC_LDFLAGS = -weak_library $(TARGET_PRIVATE_FRAMEWORK_PATH)/SpringBoardUIServices.framework/SpringBoardUIServices

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 backboardd"
	rm -rf *.deb
SUBPROJECTS += bitcoinncprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
