top = $(shell git rev-parse --show-toplevel)
key = $(shell basename ${top})

all: build.md ${key}.pdf

new: clean all

.PHONY: clean
clean:
	rm -f build.md ${key}.pdf

build.md:
	echo "top:${top}"
	book-binder start.yml links.md build.md "${top}" "https://github.com/sixarm/unix-shell-script-tactics/doc/"

${key}.pdf:
	pandoc-from-markdown-to-pdf build.md -o ${key}.pdf
