#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#!/usr/bin/env python
"""mapper.py"""

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    words = line.split()
    # increase counters
    topwords=["golf","football","game","soccer","play","league","college","good","baseball","basketball"]
    for topword in topwords:
            if topword in words:
                for word in words:
                    if(word!=topword):
                        print('%s\t%s' % (topword+","+word, 1))

