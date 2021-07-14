            echo "Fred apples 20

            Susy oranges 5

            Mark watermellons 12

            Robert pears 4

            Terry oranges 9

            Lisa peaches 7

            Susy oranges 12

            Mark grapes 39

            Anne mangoes 7

            Greg pineapples 3

            Oliver rockmellons 2

            Betty limes 14" > mysampledata.txt

echo -e "\nidentify every line which contained the string mellon with line number >>"	    
grep -n  'mellon'  mysampledata.txt
echo -e "\nidentify every line which contained the string mellon >>"	
grep 'mellon'  mysampledata.txt
echo -e "\nidentify any line with two or more vowels in a row >>"
grep -E '[ioeauIOEAU]' mysampledata.txt
echo -e "\nidentify  any line with a 2 on it which is not the end of the line"
grep -E '[[2][^2]]*$' mysampledata.txt
echo -e "\nidentify  any line with number 2 as the last character on the line"
grep -E '2$' mysampledata.txt
echo -e "\nidentify  each line which contains either 'is' or 'go' or 'or'"
grep -E 'is|go|or' mysampledata.txt 
