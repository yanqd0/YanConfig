Default:
	@echo "Usage:"
	@echo "  make install:      Install if no previous config files found."
	@echo "  make update:       Update if previous config files found."

install:
	@source ".shell/install.sh"

update:
	@source ".shell/update.sh"

