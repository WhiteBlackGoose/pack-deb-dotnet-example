#!/bin/bash
cd output/src
# debuild -us -uc --lintian-opts="--no-lintian"

# https://www.mail-archive.com/ubuntu-bugs@lists.ubuntu.com/msg5827646.html
# debuild -us -uc --check-option="--no-lintian"
# debuild -us

debuild --check-option="--no-lintian"
