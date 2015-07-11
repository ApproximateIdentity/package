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
	rm -rf build dist MANIFEST

code-analysis:
	flake8 $(PACKAGE) | grep -v __init__ | grep -v external
	pylint -E -i y $(PACKAGE)/ -d E1103,E0611,E1101

clean-debian:
	rm -rf debian debian-build

clean-all: clean clean-debian

debian-package: clean-debian
	make-deb
	dpkg-buildpackage -d -us -uc
	mkdir debian-build
	mv ../*.dsc ../*.tar.gz ../*.changes ../*.deb debian-build

install-debian:
	dpkg -i debian-build/$(PACKAGE)*.deb

uninstall-debian:
	dpkg -r $(PACKAGE)
