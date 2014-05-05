# -*- coding: utf-8 -*-

import readline
import rlcompleter
if 'libedit' in readline.__doc__:
  readline.parse_and_bind("bind ^I rl_complete")
else:
  readline.parse_and_bind("tab: complete")

import sys
import codecs
reload(sys)
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)
sys.stdin = codecs.getreader('utf_8')(sys.stdin)
sys.setdefaultencoding('utf-8')

import re, pprint
def pp(obj):
  pp = pprint.PrettyPrinter(indent=4, width=160)
  str = pp.pformat(obj)
  return re.sub(r"\\u([0-9a-f]{4})", lambda x: unichr(int("0x"+x.group(1), 16)), str)
