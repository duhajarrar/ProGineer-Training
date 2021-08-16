#! /usr/bin/env python3
#import sys
import os

def test_file1_missed():
	case_result=(os.popen('./newDiff -file_2 d.txt -go'))
	#print("***",case1Result.read())
	assert case_result.read()=="File #1 not found\n","test failed1"
	#os.kill(case1Result.pid,signal.SIGKILL)
	#assert tdiff.file1("Duha") == "File #1 not found","test failed1"

def test_file2_missed():
	case_result=(os.popen('./newDiff -file_1 d.txt -go'))
	assert case_result.read()=="File #2 not found\n","test failed2"
	#os.kill(case1Result.pid,signal.SIGKILL)
	
def test_go():
	case_result=(os.popen('./newDiff -file_1 d.txt -file_2 d.txt -go'))
	assert case_result.read()=="Go\n","test failed3"
	#os.kill(case1Result.pid,signal.SIGKILL)
def test_true():
	case_result=(os.popen('./newDiff -file_1 d.txt -file_2 d.txt'))
	assert case_result.read()=="True\n","test failed4"
	
def test_false():
	case_result=(os.popen('./newDiff -file_1 d.txt -file_2 d1.txt'))
	assert case_result.read()=="False\n","test failed5"

def test_EQseries():
	case_result=(os.popen('./newDiff -file_1 "d.txt d1.txt" -file_2 "d1.txt d1.txt"'))
	assert case_result.read()=="False,True\n","test failed6"
	
def test_NEQseries():
	case_result=(os.popen('./newDiff -file_1 "d.txt d1.txt" -file_2 "d1.txt d1.txt"'))
	assert case_result.read()=="False,True\n","test failed7"
			
def test_separator():
	case_result=(os.popen('./newDiff -file_1 "d.txt,d1.txt" -file_2 "d1.txt,d1.txt"'))
	assert case_result.read()=="Wrong Separator, Please separate using space!\n","test failed8"

