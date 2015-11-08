#!/usr/bin/env python
# coding=utf-8

import os
import shutil

CONFIG_DIR = 'MacOSX'
BACKUP_DIR = '.backup'


def get_src_paths(config_dir):
    src_paths = []
    for root, dirs, files in os.walk(config_dir):
        if files is not []:
            for f in files:
                src_paths.append(root + '/' + f)
    return src_paths


def store_backup_if_exist(src_paths):
    if hasBackup():
        print "There is a backup!"
        print "Try `make uninstall`, `make update`, or `rm -rf .backup` ."
        exit(1)
    else:
        store_backup(src_paths)


def hasBackup():
    return os.path.isdir(BACKUP_DIR)


def get_des_path(src_path):
    return src_path.replace(CONFIG_DIR, os.path.expanduser('~'))


def store_backup(src_paths):
    os.mkdir(BACKUP_DIR)

    print '-------- Store backup  --------'
    for src in src_paths:
        des = get_des_path(src)
        bak = src.replace(CONFIG_DIR, BACKUP_DIR)
        if not os.path.isdir(os.path.dirname(bak)):
            print 'mkdirs ', os.path.dirname(bak)
            os.makedirs(os.path.dirname(bak))
        if os.path.isfile(des):
            print des, '->', bak
            shutil.move(des, bak)


def install(src_paths):
    print '-------- Install begin --------'
    for src in src_paths:
        des = get_des_path(src)
        print src, '->', des
        shutil.copy2(src, des)
    print '-------- Install end   --------'


if __name__ == '__main__':
    src_paths = get_src_paths(CONFIG_DIR)
    store_backup_if_exist(src_paths)
    install(src_paths)
