from ctypes import cdll
import os
cur = cdll.LoadLibrary(os.path.abspath('test.cpython-38-x86_64-linux-gnu.so'))
print(cur)
aa = cur.add()
print(aa(3,6))
