#
# Copyright (C) 2001-2004 Sistina Software, Inc. All rights reserved.
# Copyright (C) 2004-2005, 2008 Red Hat, Inc. All rights reserved.
#
# This file is part of LVM2.
#
# This copyrighted material is made available to anyone wishing to use,
# modify, copy, or redistribute it subject to the terms and conditions
# of the GNU General Public License v.2.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

srcdir = .
top_srcdir = ../../../..
top_builddir = ../../../..


INCLUDES += -I${top_srcdir}/tools
CLDFLAGS += -L${top_builddir}/tools

SOURCES = dmeventd_mirror.c

ifeq ("","dylib")
  LIB_SHARED = libdevmapper-event-lvm2mirror.dylib
else
  LIB_SHARED = libdevmapper-event-lvm2mirror.so
endif

LIB_VERSION = $(LIB_VERSION_LVM)

include $(top_builddir)/make.tmpl

LIBS += -ldevmapper  

install_lvm2: libdevmapper-event-lvm2mirror.$(LIB_SUFFIX)
	$(INSTALL) -D $(OWNER) $(GROUP) -m 555 $(STRIP) $< \
		$(libdir)/$<.$(LIB_VERSION)
	$(LN_S) -f $<.$(LIB_VERSION) $(libdir)/$<

install: install_lvm2
