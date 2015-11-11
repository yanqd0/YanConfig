#!/usr/bin/env python
# coding=utf-8

# YanConfig Copyright (C) 2015 yanqd0@gmail.com
#
# This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
# This is free software, and you are welcome to redistribute it under certain
# conditions; see the LISENSE in the root of this project.

import mkutil

if __name__ == '__main__':
    src_paths = mkutil.get_src_paths()

    print '-------- Store backup  --------'
    mkutil.store_backup_if_exist(src_paths)
    print '-------- Link begin    --------'
    mkutil.link_src_to_des(src_paths)
    print '-------- Link end      --------'
