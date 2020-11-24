PREFIX ?= /data/data/com.lifehost/files/usr
CFLAGS += -std=c11 -Wall -Wextra -pedantic -Werror -DPREFIX=\"$(PREFIX)\"

termux-api: lifehost-api.c

install: termux-api
	mkdir -p $(PREFIX)/bin/ $(PREFIX)/libexec/
	install lifehost-api $(PREFIX)/libexec/
	install lifehost-callback $(PREFIX)/libexec/
	cd scripts; for i in *; do \
	  sed -e "s|@TERMUX_PREFIX@|$(PREFIX)|g" $$i > $(PREFIX)/bin/$$i; \
	  chmod 700 $(PREFIX)/bin/$$i; \
	done

.PHONY: install
