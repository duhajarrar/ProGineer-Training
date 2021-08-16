#! /usr/bin/env python3
import argparse
def CompareFiles(files1,files2,printSt):
    result=[]
    for i in range(len(files1)):
        f1 =open(files1[i]).read()
        f2 =open(files2[i]).read()
        if printSt:
            if f1==f2:
                result.append("Go")
            else:
                result.append("Don't Go")
        else:
            result.append(str(f1==f2))
    return result

def file1(f):
    if f == None :
        #print("File #1 not found")
        return "File #1 not found"
    else:
    	print("FILE 1")
def file2(f):
    if f == None :
        print("File #2 not found")
        return "File #2 not found"
def sep(files1,argsFile1,files2,argsFile2):
	if (argsFile1).count('.') != len(files1) or (argsFile2).count('.') != len(files2):
	    print("Wrong Separator, Please separate using space!")
	    return "Wrong Separator, Please separate using space!"
	   
def main():
#if __name__ == '__main__':
         parser = argparse.ArgumentParser(description="compare 2 series of files >> ")
         parser.add_argument('-file_1','--file1',help="first file. Could be one file or multi files")
         parser.add_argument('-file_2','--file2',help="2nd file. Could be one file or multi files")
         parser.add_argument('-go','--go',action="store_true",help="print go/no go instead of true/false")
         args=parser.parse_args()

         if file1(args.file1) == "File #1 not found":
            return
         if file2(args.file2) == "File #2 not found":
            return


	#if file1(args.file1) != "File #1 not found" and file2(args.file2) == "File #2 not found":
         files1=(args.file1).split()
         files2=(args.file2).split()
         if sep(files1,args.file1,files2,args.file2) == "Wrong Separator, Please separate using space!":
            return
         minLength=min(len(files1),len(files2))
         result=CompareFiles(files1[:minLength],files2[:minLength],args.go)

         print(",".join(result))
         return ",".join(result)
#main()
