LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

common_src_dir := $(LOCAL_PATH)/..
# Error resilience tool
ERROR_RESILIENCE  = n

LOCAL_SRC_FILES := jpegdecapi.c \
		   jpegdechdrs.c \
		   jpegdecinternal.c \
		   jpegdecscan.c \
		   jpegdecutils.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/ \
		    $(common_src_dir)/inc \
		    $(common_src_dir)/config \
		    $(common_src_dir)/common \
		    $(common_src_dir)/dwl
LOCAL_CFLAGS := -DANDROID_MOD
#		-DDEC_X170_OUTPUT_FORMAT=DEC_X170_OUTPUT_FORMAT_RASTER_SCAN
# Add error resilience flag (or not) to CFLAGS
ifeq ($(ERROR_RESILIENCE),y)
  LOCAL_CFLAGS += -DJPEGDEC_ERROR_RESILIENCE
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libx170jpeg
include $(BUILD_STATIC_LIBRARY)

