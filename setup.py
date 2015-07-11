from distutils.core import setup

DISTNAME = 'package'
LICENSE = 'GPLV2'
MAINTAINER = "Thomas Nyberg"
EMAIL = "tomnyberg@gmail.com"
URL = "https://github.com/ApproximateIdentity/package"
DESCRIPTION = ("An empty example package.")

SCRIPTS = ['package/package.py']

PACKAGES =  ['package']

setup(
    name=DISTNAME,
    version='0.0.1',
    packages=PACKAGES,
    scripts=SCRIPTS,
    license=LICENSE,
    url=URL,
    maintainer_email=EMAIL,
    maintainer=MAINTAINER,
    description=DESCRIPTION,
    long_description="None.")
