echo "Task2 Q1: Write a shell script to calculate the sum of 1-100 >>"
sum=0
for((i=1;i<=100;i++))
do
	((sum=$i+$sum))
done
echo "Sum of 1 to 100 = $sum"
