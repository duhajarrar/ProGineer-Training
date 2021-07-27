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
	echo "| -s, -sort    To compare files after sorting their contens                    |"
	echo ".==============================================================================."
	echo -e "HOW TO USE >> \nExample : ./tdiff.sh -f1 <FIRST ARRAY OF FILES> -f2 <SECOND ARRAY OF FILES> -sort -print_go"
else if [ $1 == "-file_1" ] || [ $1 == "-f1" ]; then
	file1String=$2
	file1Array=($file1String)
	echo -e "\nFirst Array of files length : ${#file1Array[@]}"
	if [ $3 == "-file_2" ] || [ $3 == "-f2" ]; then
	file2String=$4
	file2Array=($file2String)
	echo "Second Array of files length : ${#file2Array[@]}"
	resultGo=""
	resultTrue=""

	((a=${#file1Array[@]}))
	((b=${#file2Array[@]}))

	if [ $a -eq $b ]; then	
		echo "The length of second array = first array of files"
		((iteration = $a))
	else 
           if [ $a -gt $b ]; then
	        echo "The length of first array > second array of files"
	      	((iteration = $b))
      	   else
	        echo "The length of second array > first array of files"
	        ((iteration = $a))
      	   fi
        echo -e "Since the number of files passed not equal we will iterate on the minimum number of file passed"
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
		echo "Second file not found"
	fi

	else
		echo "First file not found"
	fi
fi
