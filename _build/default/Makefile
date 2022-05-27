SOURCES = $(wildcard *.ml*)
TARGET = main.native

$(TARGET): $(SOURCES)
	ocamlbuild $@ -no-hygiene

clean:
	ocamlbuild -clean

.PHONY: clean