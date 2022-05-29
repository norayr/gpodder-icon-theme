#
# Makefile for installing gpodder-icon-theme
# Thomas Perl <thpinfo.com/about>; 2009-09-07
#

#PREFIX ?= /usr

#THEME_ROOT=$(DESTDIR)$(PREFIX)/share/icons/gpodder
THEME_ROOT=$(DESTDIR)/opt/gpodder-icon-theme/gpodder

FOLDERS=$(shell find icons -mindepth 2 -type d)

install:
	install -m755 -d $(subst icons,$(THEME_ROOT),$(FOLDERS))
	for folder in $(FOLDERS); do \
	    destfolder=$$(echo $$folder | sed -e 's@icons@$(THEME_ROOT)@g'); \
	    install -m644 $$folder/*.png $$destfolder/; \
	done
	install -m644 icons/index.theme $(THEME_ROOT)/index.theme
	gtk-update-icon-cache $(THEME_ROOT)

uninstall:
	rm -rf $(THEME_ROOT)

.PHONY: install uninstall

