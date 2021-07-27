echo "Task2 Q2 & Q3 & Q4 >>"
echo "***************************************************************************************************"
echo "Q2: Using a shell script create directories from A-Z in root dir. Then copy all the directories in the /root/ directory to the /tmp/ directory."
mkdir root
cd root
for i in {A..Z}
do
	echo "$i File created @ Root Directory"
	mkdir $i

done
cd 
mkdir tmp
cp -r root/* tmp/
echo -e "\nRoot Files copied to tmp Successfully ..."
echo "==================================================================================================="

echo -e "\nQ3: Write a shell script which lists just the directories in the current directory (tmp)"
cd tmp
echo -e "\ntmp Directories: "
ls -d */
echo "==================================================================================================="
echo -e "\nQ4: Write a script that will go through the directories in tmp and create a file inside the dir that called letter_file.txt and write inside the file Helloletter, welcome to shell!. For example in dir A there should be file A_file.txt and written the file should be Hello A, welcome to shell"
for i in *;
do
cd $i
#touch ${i}_$file.txt
echo "Hello $i, welcome to shell!" > ${i}_file.txt
echo "${i}_file.txt created Successfully ..."
cd ..
done
