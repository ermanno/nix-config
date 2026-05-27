.PHONY: install switch update

install:
	@command -v nix >/dev/null || { \
		echo "Installing Nix..."; \
		curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install; \
		echo "Restart your shell, then run 'make switch'"; \
		exit 0; \
	}
	@echo "Nix already installed, running switch..."
	@$(MAKE) switch

switch:
	home-manager switch --flake .

update:
	nix flake update
	@$(MAKE) switch
