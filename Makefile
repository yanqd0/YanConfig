Default:
	@echo "Usage:"
	@echo "  make install:      Install if no previous config files found."
	@echo "  make update:       Update if previous config files found."

install:
	@.python/install.py

update:
	@.python/update.py

