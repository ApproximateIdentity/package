PACKAGE=package
PYTHON?=python

all: install

install: clean
	$(PYTHON) setup.py sdist
	pip install dist/*

reinstall: uninstall install

uninstall:
	pip uninstall $(PACKAGE)

clean:
	$(PYTHON) setup.py clean --all
	rm -rf dist MANIFEST

code-analysis:
	flake8 $(PACKAGE) | grep -v __init__ | grep -v external
	pylint -E -i y $(PACKAGE)/ -d E1103,E0611,E1101
