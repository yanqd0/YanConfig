#!/usr/bin/env python
# coding=utf-8

import mkutil

if __name__ == '__main__':
    src_paths = mkutil.get_src_paths()

    mkutil.break_if_des_not_exist(src_paths)
    print '-------- update begin  --------'
    mkutil.copy_src_to_des(src_paths)
    print '-------- update end    --------'
