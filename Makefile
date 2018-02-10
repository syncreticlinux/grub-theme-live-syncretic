Version=17.0.1

PREFIX = /usr/local

THEME = \
	$(wildcard syncretic-live/*.png) \
	syncretic-live/theme.txt \
	syncretic-live/*.pf2

install:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/grub/themes/syncretic-live
	install -m0644 ${THEME} $(DESTDIR)$(PREFIX)/share/grub/themes/syncretic-live

uninstall:
	for f in ${THEME}; do rm -f $(DESTDIR)$(PREFIX)/share/grub/theme/syncretic-live/$$f; done

dist:
	git archive --format=tar --prefix=grub-theme-$(Version)/ $(Version) | gzip -9 > grub-theme-$(Version).tar.gz
	gpg --detach-sign --use-agent grub-theme-$(Version).tar.gz

.PHONY: install uninstall dist
