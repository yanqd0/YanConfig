#!/usr/bin/env python
# coding=utf-8

import shutil

import mkutil

if __name__ == '__main__':
    if mkutil.has_backup():
        print mkutil.BACKUP_DIR, '->'
        shutil.rmtree(mkutil.BACKUP_DIR)
