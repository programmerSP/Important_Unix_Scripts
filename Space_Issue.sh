#MAX=40
EMAIL=user@Domain.com
PART=sda1
USE=`df -h |grep $PART | awk '{ print $5 }' | cut -d'%' -f1`
#USE=97
echo "Hi Team," $'\n' > b.txt
if [ $USE -gt 85 ]; then
  if [ $USE -lt 90 ]; then
    echo "Threshold limit 85% Crossed. Current Occupancy : $USE% " > a.txt
  fi
  if [ $USE -gt 90 ]; then
  if [ $USE -lt 95 ]; then
    echo "Concerned Limit  90% Crossed. Current Occupancy : $USE% " > a.txt
  fi
  if [ $USE -gt 95 ]; then
    echo "Please Delete Large Unrequired Files From Server !!!"$'\n'"Dangerous Limit  95% Crossed."$'\n'"Current Occupancy : $USE% " > a.txt
  fi
  fi
  echo $'\n' >> a.txt
  echo "Following are the Large Files ( Above 100MB ) :" >> a.txt
  echo $'\n' >> a.txt
 # cd /
  find /home/ -type f -size +100M -print | xargs du -kh | sort -rn >> a.txt
  #cd -
  echo $'\n'"Thanks & Regards," $'\n' "Anonyms" >>a.txt
  cat a.txt >> b.txt
  export REPLYTO=user@Domain.com
  mail -s "SPACE ISSUE | $USE% Present Usage" -r Space_Alerts $EMAIL < b.txt
fi
