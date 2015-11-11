# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

Default:
	@echo "Usage:"
	@echo "  make install:      Install after previous config files store to ./.backup"
	@echo "  make link:         Make soft links instead of copy files."
	@echo "  make update:       Update if previous config files found."
	@echo "  make uninstall:    Delete current config files and retrieve from ./.backup"
	@echo "  make clean:        Delete ./.backup"

install:
	@.python/install.py

link:
	@.python/link.py

update:
	@.python/update.py

uninstall:
	@.python/uninstall.py

clean:
	@.python/clean.py
