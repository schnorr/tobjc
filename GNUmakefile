include $(GNUSTEP_MAKEFILES)/common.make
APP_NAME = tobjc
tobjc_OBJC_FILES = tobjc.m main.m
tobjc_RESOURCE_FILES = tobjc.gsmarkup

ifeq ($(FOUNDATION_LIB), apple)
  ADDITIONAL_INCLUDE_DIRS += -framework Renaissance
  ADDITIONAL_GUI_LIBS += -framework Renaissance
else
  ADDITIONAL_GUI_LIBS += -lRenaissance
endif

include $(GNUSTEP_MAKEFILES)/application.make
