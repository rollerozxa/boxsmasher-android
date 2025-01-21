LOVE_JNI_DIR := $(call my-dir)

ROOT := $(LOVE_JNI_DIR)/../../../..

DEPROOT := $(ROOT)/deps/deps/$(TARGET_ARCH_ABI)

include $(CLEAR_VARS)
LOCAL_MODULE := libfreetype
LOCAL_SRC_FILES := $(DEPROOT)/freetype/libfreetype.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libluajit
LOCAL_SRC_FILES := $(DEPROOT)/luajit/libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE := oboe
#LOCAL_SRC_FILES := $(DEPROOT)/oboe/liboboe.a
#include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libopenal
LOCAL_SRC_FILES := $(DEPROOT)/openal-soft/libopenal.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := SDL2_static
LOCAL_SRC_FILES := $(DEPROOT)/SDL2/libSDL2.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libvorbis
LOCAL_SRC_FILES := $(DEPROOT)/vorbis/libvorbis.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libvorbisfile
LOCAL_SRC_FILES := $(DEPROOT)/vorbis/libvorbisfile.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libogg
LOCAL_SRC_FILES := $(DEPROOT)/vorbis/libogg.a
include $(PREBUILT_STATIC_LIBRARY)

LOVE_DEPS_INCLUDE := \
	$(DEPROOT)/freetype/include/freetype2/ \
	$(DEPROOT)/freetype/include/ \
	$(DEPROOT)/luajit/include/ \
	$(DEPROOT)/openal-soft/include/ \
	$(DEPROOT)/SDL2/include/SDL2/ \
	$(DEPROOT)/vorbis/include/
#	$(DEPROOT)/oboe/include/

include $(ROOT)/love/Android.mk
