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
            result.append(f1==f2)
    return result

def main():
#if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="compare 2 series of files >> ")
    parser.add_argument('-file_1','--file1',help="first file. Could be one file or multi files")
    parser.add_argument('-file_2','--file2',help="2nd file. Could be one file or multi files")
    parser.add_argument('-go','--go',action="store_true",help="print go/no go instead of true/false")
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
        minLength=min(len(files1),len(files2))
        result=CompareFiles(files1[:minLength],files2[:minLength],args.go)
        print(".=============================================.")
        print("|              Comparison Result              |")
        print("|---------------------------------------------|")
        for i in range(minLength):
            print("      ",files1[i]," & ",files2[i]," : ",result[i],"       ")
        print("|_____________________________________________|")
main()
