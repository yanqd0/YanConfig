#!/usr/bin/env python
# coding=utf-8

import mkutil

if __name__ == '__main__':
    src_paths = mkutil.get_src_paths()

    print '-------- Store backup  --------'
    mkutil.store_backup_if_exist(src_paths)
    print '-------- Install begin --------'
    mkutil.copy_src_to_des(src_paths)
    print '-------- Install end   --------'
