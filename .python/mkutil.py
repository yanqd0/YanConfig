#!/usr/bin/env python
# coding=utf-8

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

import os
import shutil

CONFIG_DIR = 'MacOSX'
BACKUP_DIR = '.backup'

ignore_files = []


def get_src_paths():
    return get_paths_of(CONFIG_DIR)


def get_bak_paths():
    return get_paths_of(BACKUP_DIR)


def get_paths_of(dir_name):
    src_paths = []
    for root, dirs, files in os.walk(dir_name):
        for f in files:
            p = root + '/' + f
            if not in_gitignore(p):
                src_paths.append(p)
    return src_paths


def in_gitignore(f):
    import re
    if ignore_files == []:
        load_ignore_files()
    for ig in ignore_files:
        if re.search(ig, f) is not None:
            return True
    return False


def load_ignore_files():
    file_list = open('.gitignore')
    for f in file_list:
        ignore_files.append(f.strip().replace('*', '.*'))


def store_backup_if_exist(src_paths):
    if has_backup():
        print "There is a backup!"
        print "Try `make uninstall`, `make update`, or `make clean` ."
        exit(1)
    else:
        store_backup(src_paths)


def has_backup():
    if not os.path.isdir(BACKUP_DIR):
        return False
    for root, dirs, files in os.walk(BACKUP_DIR):
        if files != []:
            return True
    return False


def store_backup(src_paths):
    for src in src_paths:
        des = get_des_by_src(src)
        bak = get_bak_by_src(src)
        move(des, bak)


def retrieve_backup():
    bak_paths = get_bak_paths()
    for bak in bak_paths:
        des = get_des_by_bak(bak)
        move(bak, des)
    shutil.rmtree(BACKUP_DIR)


def move(src, des):
    if os.path.isfile(src):
        if not os.path.isdir(os.path.dirname(des)):
            print os.path.dirname(des), '<='
            os.makedirs(os.path.dirname(des))
        print src, '->', des
        shutil.move(src, des)


def get_des_by_src(src):
    return src.replace(CONFIG_DIR, os.path.expanduser('~'))


def get_bak_by_src(src):
    return src.replace(CONFIG_DIR, BACKUP_DIR)


def get_des_by_bak(bak):
    return bak.replace(BACKUP_DIR, os.path.expanduser('~'))


def copy_src_to_des(src_paths):
    for src in src_paths:
        des = get_des_by_src(src)
        print src, '=>', des
        shutil.copy2(src, des)


def copy_src_to_des_if_new(src_paths):
    for src in src_paths:
        des = get_des_by_src(src)
        src_stat = os.stat(src)
        des_stat = os.stat(des)
        if src_stat.st_mtime > des_stat.st_mtime:
            print src, '=>', des
            shutil.copy2(src, des)


def break_if_des_not_exist(src_paths):
    for src in src_paths:
        des = get_des_by_src(src)
        if not os.path.isfile(des):
            print des, 'not exists!'
            exit(1)


def break_if_no_backup():
    if not has_backup():
        print 'No backup found!'
        exit(0)


def remove_des_by_src(src_paths):
    for src in src_paths:
        des = get_des_by_src(src)
        if os.path.isfile(des):
            print des, '->'
            os.remove(des)


def link_src_to_des(src_paths):
    for src in src_paths:
        des = get_des_by_src(src)
        abs_src = os.path.abspath(src)
        cmd = 'ln -s ' + abs_src + ' ' + des
        print cmd

        ret = os.system(cmd)
        if ret != 0:
            exit(ret)
