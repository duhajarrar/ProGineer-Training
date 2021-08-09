#! /usr/bin/env python3
import sys
import os
import argparse
import time
def CompareFiles(files1,files2,tmp_dir,diff_tool):
    result=[]
    print("Diff GUI Tool >> ")
    if not os.path.exists(tmp_dir):
    	os.popen('mkdir '+tmp_dir)
    for i in range(len(files1)):
    	os.popen('cp '+files1[i]+' '+tmp_dir)
    	os.popen('cp '+files2[i]+' '+tmp_dir)
    	os.popen('cd '+tmp_dir)
    	print("Files #",i+1,"/",len(files1)," comparison >>")
    	out=os.popen(diff_tool+' '+files1[i]+' '+files2[i])
    	output=out.read()
    	if(diff_tool == "diff"):
    		print(output)
    	os.popen('cd ..')
    	f1 =open(files1[i]).read()
    	f2 =open(files2[i]).read()
    	result.append(f1==f2)
    	time.sleep(1)
    	os.popen('rm -v '+tmp_dir+'/*')
    return result

def main():
#if __name__ == '__main__':    
    parser = argparse.ArgumentParser(description="compare 2 series of files >> ")
    parser.add_argument('-file_1','--file1',help="first file. Could be one file or multi files")
    parser.add_argument('-file_2','--file2',help="2nd file. Could be one file or multi files")
    parser.add_argument('-diff_tool','--diff_tool',help="diff tool to use in comparison",default="tkdiff")
    parser.add_argument('-tmp_dir','--tmp_dir',help="name of temp dir to store files in when processing",default='tmp')
    args=parser.parse_args()
    print(args)
    if args.file1 == None :
        print("File #1 not found")
        print("So comparison stopped , please try again")
        return
    if args.file2 == None :
        print("File #2 not found")
        print("So comparison stopped , please try again")
        return
    if args.file1 != None and args.file2 != None:
        files1=(args.file1).split()
        files2=(args.file2).split()
        if (args.file1).count('.') != len(files1) or (args.file2).count('.') != len(files2):
            print("Wrong Separator, Please separate using space!")
            return
        minLength=min(len(files1),len(files2))
        result=CompareFiles(files1[:minLength],files2[:minLength],args.tmp_dir,args.diff_tool)
        print(".=============================================.")
        print("|              Comparison Result              |")
        print("|---------------------------------------------|")
        for i in range(minLength):
            print("      ",files1[i]," & ",files2[i]," : ",result[i],"       ")
        print("|_____________________________________________|")
main()
