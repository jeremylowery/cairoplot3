VERSION=3.1.2

TARBALL=dist/cairoplot-$(VERSION).tar.gz
WHEEL=dist/Cairoplot-$(VERSION)-py3-none-any.whl
PYTHON=.venv/bin/python

.PHONY: build clean devenv upload

build: $(WHEEL)

clean:
	rm -f $(TARBALL)
	rm -f $(WHEEL)
	rm -rf build

upload: $(WHEEL)
	python3 -m twine upload $(TARBALL) $(WHEEL)

devenv: .venv

.venv:
	uv venv
	uv pip install build twine

$(TARBALL): cairoplot.py series.py seriestests.py setup.py
	$(PYTHON) -m build

$(WHEEL): $(TARBALL)

