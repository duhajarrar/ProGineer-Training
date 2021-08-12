#! /usr/bin/env python3
import sys
import unittest
import os
class MyTest(unittest.TestCase):

	def test_file1_missed(self):
		case1Result=(os.popen('./tdiff -file_2 d.txt -go')).read()
		self.assertEqual(case1Result,"File #1 not found\n")
	
	def test_file2_missed(self):
		case1Result=(os.popen('./tdiff -file_1 d.txt -go')).read()
		self.assertEqual(case1Result,"File #2 not found\n")
		
		
	def test_go(self):
		case1Result=(os.popen('./tdiff -file_1 d.txt -file_2 d.txt -go')).read()
		self.assertEqual(case1Result,"Go\n")

	def test_true(self):
		case1Result=(os.popen('./tdiff -file_1 d.txt -file_2 d.txt')).read()
		self.assertEqual(case1Result,"True\n")
		
	def test_false(self):
		case1Result=(os.popen('./tdiff -file_1 d.txt -file_2 d1.txt')).read()
		self.assertEqual(case1Result,"False\n")
	
	def test_EQseries(self):
		case1Result=(os.popen('./tdiff -file_1 "d.txt d1.txt" -file_2 "d1.txt d1.txt"')).read()
		self.assertEqual(case1Result,"False,True\n")
	def test_NEQseries(self):
		case1Result=(os.popen('./tdiff -file_1 "d.txt d1.txt d2.txt" -file_2 "d1.txt d1.txt"')).read()
		self.assertEqual(case1Result,"False,True\n")
				
	def test_separator(self):
		case1Result=(os.popen('./tdiff -file_1 "d.txt,d1.txt" -file_2 "d1.txt,d1.txt"')).read()
		self.assertEqual(case1Result,"Wrong Separator, Please separate using space!\n")

if __name__ == '__main__':
	unittest.main()
