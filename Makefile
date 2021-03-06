build: index.css index.js components
	component build -v
	@touch build

components: component.json
	component install

%.css: src/%.scss
	sass -C $< $@

%.js: src/%.coffee
	coffee -cp $< > $@

serve: build
	@command -v serve > /dev/null 2>&1 || { echo "serve not found: npm install -g serve"; exit 1; }
	serve

.PHONY: serve
