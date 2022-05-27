SOURCES = $(wildcard *.ml*)
TARGET = main.native

$(TARGET): $(SOURCES)
	ocamlbuild $@

clean:
	ocamlbuild -clean

.PHONY: clean