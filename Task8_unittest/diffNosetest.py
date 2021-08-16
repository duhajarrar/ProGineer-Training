#! /usr/bin/env python3
import sys
import pytest
import os

def test_file1_missed():
	case1Result=(os.popen('./newDiff -file_2 d.txt -go'))
	#print("***",case1Result.read())
	assert case1Result.read()=="File #1 not found\n","test failed1"
	#os.kill(case1Result.pid,signal.SIGKILL)
	#assert tdiff.file1("Duha") == "File #1 not found","test failed1"

def test_file2_missed():
	case1Result=(os.popen('./newDiff -file_1 d.txt -go'))
	assert case1Result.read()=="File #2 not found\n","test failed2"
	#os.kill(case1Result.pid,signal.SIGKILL)
	
def test_go():
	case1Result=(os.popen('./newDiff -file_1 d.txt -file_2 d.txt -go'))
	assert case1Result.read()=="Go\n","test failed3"
	#os.kill(case1Result.pid,signal.SIGKILL)
def test_true():
	case1Result=(os.popen('./newDiff -file_1 d.txt -file_2 d.txt'))
	assert case1Result.read()=="True\n","test failed4"
	
def test_false():
	case1Result=(os.popen('./newDiff -file_1 d.txt -file_2 d1.txt'))
	assert case1Result.read()=="False\n","test failed5"

def test_EQseries():
	case1Result=(os.popen('./newDiff -file_1 "d.txt d1.txt" -file_2 "d1.txt d1.txt"'))
	assert case1Result.read()=="False,True\n","test failed6"
def test_NEQseries():
	case1Result=(os.popen('./newDiff -file_1 "d.txt d1.txt" -file_2 "d1.txt d1.txt"'))
	assert case1Result.read()=="False,True\n","test failed7"
			
def test_separator():
	case1Result=(os.popen('./newDiff -file_1 "d.txt,d1.txt" -file_2 "d1.txt,d1.txt"'))
	assert case1Result.read()=="Wrong Separator, Please separate using space!\n","test failed8"

