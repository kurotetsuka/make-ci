# make-ci :: Local CI for Make

Use with `make-ci <target> <watch files>`, or by adding a corresponding `ci` definition to your makefile and running `make ci`. Every save (or other filesystem modification) of the watch files will trigger an execution of `make <target>`. To stop the process, just hit ctrl-c.

Author: [Kurotetsuka](https://github.com/kurotetsuka)  
License: [MIT](legal/mit.md)  

## Dependencies
 - `inotifywait` :: On Archlinux, just `sudo pacman -S inotify-tools`.

## Installation
To install for all users, run `sudo ./install`. To install just for your user, run `sudo ./install-local`.

## Usage

For a single target, do the following:

```bash
make-ci <make target> <watch files>
```

For multiple targets, just embed the targets in quotes:

```bash
make-ci "<make target 0> <make target 1> ..." <watch files>
```

Alternatively, add this to your makefile:

```make
ci:
	make-ci <target> <watch files>
```

\- and run `make ci`. You can stop it with ctrl-c.

## Examples
```bash
# for a makefile where `a.out` depends on `a.c`, `b.c`, and `c.c`.
make-ci a.out a.c b.c c.c

# for a makefile where `a.out` and `a.so` depends on `a.c`.
make-ci "a.out a.so" a.c
```

### Java Makefile
```make
# vars
class_files = \
	bin/kuro/json/JSONAdapter.class \
	bin/kuro/json/test/TestJSONAdapter.class \
	bin/kuro/json/tutorial/Tutorial.class \

source_files = \
	src/kuro/json/JSONAdapter.java \
	src/kuro/json/test/TestJSONAdapter.java \
	src/kuro/json/tutorial/Tutorial.java \

# compilation definitions
$(class_files): bin/%.class : src/%.java
	javac -cp $(cp) -d bin $(warnings) $<

# command definitions
build: $(class_files)

ci:
	make-ci build $(source_files)
```
