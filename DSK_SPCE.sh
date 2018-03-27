EMAIL=user@Domain.com
PART=sda1
#echo "Percent used: $USE" | mail -s "Running out of disk space" $EMAIL
sh /home/sp07543/Important_Scripts/Test_Server_utilization.sh > System_Check.txt
mail -s "Dev Server SD-2E06-2D06 | Server Information Mail" -r SENDER recipient@Domain.com  < System_Check.txt
