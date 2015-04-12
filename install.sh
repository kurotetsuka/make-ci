#!/bin/bash

# vars
install_dir = /usr/local/bin
file = make-ci

# install
install -m 755 $(file) $(install_dir)
