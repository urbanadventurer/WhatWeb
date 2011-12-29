NAME = whatweb
PREFIX = /usr
BINPATH = $(PREFIX)/bin
LIBPATH = $(PREFIX)/share
MANPATH = $(PREFIX)/share/man
DOCPATH = $(PREFIX)/share/doc

install:
	# upgrade/installation will leave the my-plugins folder
	rm -Rf $(DESTDIR)$(BINPATH)/$(NAME) $(DESTDIR)$(MANPATH)/man1/$(NAME).1 $(DESTDIR)$(MANPATH)/man1/$(NAME).1.gz $(DESTDIR)$(DOCPATH)/$(NAME) $(DESTDIR)$(LIBPATH)/$(NAME)/plugins-disabled $(DESTDIR)$(LIBPATH)/$(NAME)/plugins $(DESTDIR)$(LIBPATH)/$(NAME)/lib $(DESTDIR)$(LIBPATH)/$(NAME)/plugin-development $(DESTDIR)$(LIBPATH)/$(NAME)/addons

	install -p -D -m 755 $(NAME) $(DESTDIR)$(BINPATH)/$(NAME)
	install -p -D -m 644 $(NAME).1 $(DESTDIR)$(MANPATH)/man1/$(NAME).1
	gzip -f $(DESTDIR)$(MANPATH)/man1/$(NAME).1
	install -d $(DESTDIR)$(LIBPATH)/$(NAME)
	install -d $(DESTDIR)$(DOCPATH)/$(NAME)
	cp -p -r my-plugins $(DESTDIR)$(LIBPATH)/$(NAME)/
	cp -p -r plugins-disabled plugins lib plugin-development addons $(DESTDIR)$(LIBPATH)/$(NAME)/
	cp -p -r CHANGELOG INSTALL LICENSE README whatweb.xsl $(DESTDIR)$(DOCPATH)/$(NAME)/

clean:
	# clean will remove your my-plugins folder. be warned
	rm -Rf $(DESTDIR)$(BINPATH)/$(NAME) $(DESTDIR)$(MANPATH)/man1/$(NAME).1 $(DESTDIR)$(MANPATH)/man1/$(NAME).1.gz $(DESTDIR)$(LIBPATH)/$(NAME) $(DESTDIR)$(DOCPATH)/$(NAME)


