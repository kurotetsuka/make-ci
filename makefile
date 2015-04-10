# globals
default:

# vars
install_dir = /usr/local/bin
install_dir_local = ~/.local/bin
file = make-ci

# commands
install: $(file)
	sudo install -m 755 $(file) $(install_dir)
local-install: $(file)
	sudo install -m 755 $(file) $(install_dir_local)

