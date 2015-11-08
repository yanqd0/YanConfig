Default:
	@echo "Usage:"
	@echo "  make install:      Install after previous config files store to ./.backup"
	@echo "  make update:       Update if previous config files found."
	@echo "  make uninstall:    Delete current config files and retrieve from ./.backup"
	@echo "  make clean:        Delete ./.backup"

install:
	@.python/install.py

update:
	@.python/update.py

uninstall:
	@.python/uninstall.py

clean:
	@.python/clean.py
