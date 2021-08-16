echo "Test Lib:"
echo "NoseTest >>> "
nosetests diffNosetest.py
echo "UnitTest >>>"
./diffUnittest
echo "PyTest >>>"
pytest -s -v diffPytest.py
echo "<< Top 3 unittest lib >>"
echo "***** #1 PyTest *****" 
echo "      #2 NoseTest    "
echo "      #3 UnitTest    "
