from distutils.core import setup
from Cython.Build import cythonize

setup(
    name='Duha',
    packages=["Duha","sub"],
    ext_modules=cythonize("**/*.py"),
)
