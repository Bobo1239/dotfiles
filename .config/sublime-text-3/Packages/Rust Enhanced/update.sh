#!/usr/bin/env bash

unzip -p ../../Installed\ Packages/Rust\ Enhanced.sublime-package rust/cargo_settings.py > rust/cargo_settings.py
patch -p1 < build-std.patch
