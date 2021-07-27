if [ $1 == "-help" ] || [ $1 =="--h" ] || [ $1 == "-h" ]; then
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
else if [ $1 == "-file_1" ] || [ $1 == "-f1" ]; then
	file1Strings=$2
	file1Array=($file1Strings)
	echo -e "\nFirst Array of files length : ${#file1Array[@]}"
	if [ $3 == "-file_2" ] || [ $3 == "-f2" ]; then
	file2Strings=$4
	file2Array=($file2Strings)
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
	if [ $5 == "-o" ] || [ $5 == "-same_order" ]; then
		if cmp -s ${file1Array[$i]} ${file2Array[$i]}
		then
			resultGo="Go"
			resultTrue="True"
		else
			resultGo="Don't Go"
			resultTrue="False"
		fi
	else if [ $5 == "-s" ] || [ $5 == "-sort" ]; then
		if cmp -s <( sort ${file1Array[$i]}) <( sort ${file2Array[$i]})
		then
			resultGo="Go"
			resultTrue="True"
		else
			resultGo="Don't Go"
			resultTrue="False"
		fi
	fi
	fi

	if [ $6 == "-print_go" ] || [ $6 == "-go" ]; then
		echo ">> Compare ${file1Array[$i]} & ${file2Array[$i]} result : $resultGo"
	else
		echo ">> Compare ${file1Array[$i]} & ${file2Array[$i]} result : $resultTrue"
	fi
	echo "|-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-|"

	done	
	echo ".======================================================================."

	echo -e "\nComparison Done"
		else
		echo "The second file doesn't found "
	fi

	else
		echo "The First file doesn't found "
	fi
fi
