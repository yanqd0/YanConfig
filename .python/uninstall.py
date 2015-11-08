#!/usr/bin/env python
# coding=utf-8


import mkutil

if __name__ == '__main__':
    src_paths = mkutil.get_src_paths()

    print '-------- Uninstall begin --------'
    mkutil.remove_des_by_src(src_paths)
    mkutil.break_if_no_backup()
    mkutil.retrieve_backup()
    print '-------- Uninstall end   --------'
