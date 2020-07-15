NAME = whatweb
PREFIX ?= /usr
BINPATH = $(PREFIX)/bin
LIBPATH = $(PREFIX)/share
MANPATH = $(PREFIX)/share/man
DOCPATH = $(PREFIX)/share/doc

ifeq "$(PLATFORM)" ""
PLATFORM := $(shell uname)
endif

ifeq "$(PLATFORM)" "Darwin"
INSTALLD =
PREFIX ?= /usr/local
else
INSTALLD = -D
endif

install:
	# upgrade/installation will leave the my-plugins folder
	rm -Rf $(DESTDIR)$(BINPATH)/$(NAME) $(DESTDIR)$(MANPATH)/man1/$(NAME).1 $(DESTDIR)$(MANPATH)/man1/$(NAME).1.gz $(DESTDIR)$(DOCPATH)/$(NAME) $(DESTDIR)$(LIBPATH)/$(NAME)/plugins-disabled $(DESTDIR)$(LIBPATH)/$(NAME)/plugins $(DESTDIR)$(LIBPATH)/$(NAME)/lib $(DESTDIR)$(LIBPATH)/$(NAME)/plugin-development $(DESTDIR)$(LIBPATH)/$(NAME)/addons

	install -d $(DESTDIR)$(MANPATH)/man1
	install -p $(INSTALLD) -m 644 $(NAME).1 $(DESTDIR)$(MANPATH)/man1/$(NAME).1
	gzip -f $(DESTDIR)$(MANPATH)/man1/$(NAME).1
	install -d $(DESTDIR)$(LIBPATH)/$(NAME)
	install -d $(DESTDIR)$(DOCPATH)/$(NAME)
	install -d $(DESTDIR)$(BINPATH)

	# copy whatweb into LIBPATH/NAME/ and create a symbolic link in the BINPATH
	install -p $(INSTALLD) -m 755 $(NAME) $(DESTDIR)$(LIBPATH)/$(NAME)
	ln -s $(LIBPATH)/$(NAME)/$(NAME) $(DESTDIR)$(BINPATH)/$(NAME)

	cp -p -r my-plugins $(DESTDIR)$(LIBPATH)/$(NAME)/
	cp -p -r plugins-disabled plugins lib plugin-development addons $(DESTDIR)$(LIBPATH)/$(NAME)/
	cp -p -r CHANGELOG.md INSTALL.md LICENSE README.md whatweb.xsl $(DESTDIR)$(DOCPATH)/$(NAME)/
	bundle install

clean:
	# clean will remove your my-plugins folder. be warned
	rm -Rf $(DESTDIR)$(BINPATH)/$(NAME) $(DESTDIR)$(MANPATH)/man1/$(NAME).1 $(DESTDIR)$(MANPATH)/man1/$(NAME).1.gz $(DESTDIR)$(LIBPATH)/$(NAME) $(DESTDIR)$(DOCPATH)/$(NAME)

