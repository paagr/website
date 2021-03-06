SHELL := /usr/bin/zsh # needed for prettyurls
BUNDLE := bundle
YARN := yarn
ASSETS_DIR = assets
VENDOR_DIR = $(ASSETS_DIR)/vendor/
JEKYLL := $(BUNDLE) exec jekyll
PROJECT_DEPS := Gemfile package.json

.PHONY: all clean install update

all : serve

install: $(PROJECT_DEPS)
	$(BUNDLE) install
	$(YARN) install

update: $(PROJECT_DEPS)
	$(BUNDLE) update
	$(YARN) upgrade

include-yarn-deps:
	mkdir -p $(VENDOR_DIR)
	cp node_modules/jquery/dist/jquery.min.js $(VENDOR_DIR)
	cp node_modules/popper.js/dist/umd/popper.min.js $(VENDOR_DIR)
	cp node_modules/popper.js/dist/umd/popper.min.js.map $(VENDOR_DIR)
	cp node_modules/bootstrap/dist/js/bootstrap.min.js $(VENDOR_DIR)
	cp node_modules/bootstrap/dist/js/bootstrap.min.js.map $(VENDOR_DIR)
	cp node_modules/glitch-canvas/dist/glitch-canvas-browser.min.js $(VENDOR_DIR)

build-deps: clean install include-yarn-deps

build: build-deps
	JEKYLL_ENV=production $(JEKYLL) build

serve: build-deps
	JEKYLL_ENV=development $(JEKYLL) serve --livereload

clean:
	rm -fr _site/
	rm -fr $(VENDOR_DIR) #from yarn
	rm -fr .sass_cache