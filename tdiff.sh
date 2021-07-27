args=("$@")
ArgumentsNumber=$#
option=0
go=1
StopFlag=0
for (( j=0 ; j < $ArgumentsNumber ; j++ ))
do
	if [ ${args[$j]} == "-help" ] || [ ${args[$j]}  == "--h" ] || [ ${args[$j]}  == "-h" ]; then
		echo ".==============================================================================."
		echo "|                               HELP                                           |"
		echo ".______________________________________________________________________________."
		echo "| Usage: tdiff [OPTION]...                                                     |"
		echo "| Compare Series of files byte by byte.                                        |"
		echo "| Mandatory arguments to long options are mandatory for short options too.     |"
		echo "| -f1, -file_1       To pass first array of files                              |"
		echo "| -f2, -file_2       To pass second array of files                             |"
		echo "| -go, -print_go     To print go/don't go output                               |"
		echo "| -o, -same_order    To compare files without sorting their contents           |"
		echo "| -s, -sort    To compare files after sorting their contents                   |"
		echo ".==============================================================================."
		echo -e "HOW TO USE >> \nExample : ./tdiff.sh -f1 <FIRST ARRAY OF FILES> -f2 <SECOND ARRAY OF FILES> -sort -print_go"
		StopFlag=$((flag+1))
		break
	else if [ ${args[$j]}  == "-file_1" ] || [ ${args[$j]}  == "-f1" ]; then
		j=$((j+1))
		if [[ ${args[$j]} == -* ]]; then

			echo "The First file doesn't found "
			echo "So comparison stopped!"
			((StopFlag=$1))
			break
		else
			file1Strings=${args[$j]} 
			file1Array=($file1Strings)
		continue
		fi
	else if [ ${args[$j]}  == "-file_2" ] || [ ${args[$j]}  == "-f2" ]; then
		j=$((j+1))
		if [[ ${args[$j]} == -* ]]; then
			echo "The second file doesn't found "
			echo "So comparison stopped!"
			((StopFlag=$1))
			break
		else
			file2Strings=${args[$j]} 
			file2Array=($file2Strings)
			continue
		fi
	else if [ ${args[$j]} == "-o" ] || [ ${args[$j]}  == "-same_order" ]; then
		option=$((option+1))
		continue

	else if [ ${args[$j]}  == "-s" ] || [ ${args[$j]}  == "-sort" ]; then
		option=$((option+2))
		continue



	else if [ ${args[$j]} == "-go" ] || [ ${args[$j]}  == "-print_go" ]; then
		go=$((go+1))
	else
		echo "Wrong argument, please try again"
		((StopFlag=$1))
		break
	fi
	fi
	fi
	fi
	fi
	fi
done
if [ $StopFlag -eq 0 ];then
	echo -e "\nFirst Array of files length : ${#file1Array[@]}"
	echo "Second Array of files length : ${#file2Array[@]}"


	resultGo=""
	resultTrue=""

	((FirstArrayLength=${#file1Array[@]}))
	((SecondArrayLength=${#file2Array[@]}))

	if [ $FirstArrayLength -eq $SecondArrayLength ]; then	
		echo "The length of second array = first array of files"
		((iteration = $FirstArrayLength))
	else 
           if [ $FirstArrayLength -gt $SecondArrayLength ]; then
	        echo "The length of first array > second array of files"
	      	((iteration = $SecondArrayLength))
      	   else
	        echo "The length of second array > first array of files"
	        ((iteration = $FirstArrayLength))
      	   fi
        echo -e "Since the number of files passed is not equal we will iterate on the minimum number of files passed"
	fi

	echo -e "\n               >>>> Number of iteration : ${iteration} <<<<\n"
	echo ".======================================================================."
	echo "|                      Start Comparison >>                             |"
	echo "|======================================================================|"
	echo "|-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-|"
	for(( i=0 ; i < $iteration ; i++))
	do
		if [ $option -eq 1 ]; then
			if cmp -s ${file1Array[$i]} ${file2Array[$i]}
			then
				resultGo="Go"
				resultTrue="True"
			else
				resultGo="Don't Go"
				resultTrue="False"
			fi
		else if [ $option -eq 2 ]; then
			if cmp -s <( sort ${file1Array[$i]}) <( sort ${file2Array[$i]})
			then
				resultGo="Go"
				resultTrue="True"
			else
				resultGo="Don't Go"
				resultTrue="False"
			fi
		else
			echo "Sort/Without Sort Option Doesn't Selected!"
		fi
		fi

		if [ $go -eq 2 ]; then
			echo ">> Compare ${file1Array[$i]} & ${file2Array[$i]} result : $resultGo"
		else
			echo ">> Compare ${file1Array[$i]} & ${file2Array[$i]} result : $resultTrue"
		fi
		echo "|-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-|"
	done	
	echo ".======================================================================."
	echo -e "\nComparison Done"
fi
