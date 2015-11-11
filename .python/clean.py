#!/usr/bin/env python
# coding=utf-8

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

import shutil

import mkutil

if __name__ == '__main__':
    if mkutil.has_backup():
        print mkutil.BACKUP_DIR, '->'
        shutil.rmtree(mkutil.BACKUP_DIR)
