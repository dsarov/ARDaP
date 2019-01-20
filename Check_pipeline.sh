#! /bin/bash

echo -e "This script will determine the rate of false positives, false negatives, true positive and true negatives following a complete ARDaP run.\n\n"

# The script requires the following files

DATASHEET=/home/dsarovich2/bin/ARDaP/Databases/Pseudomonas_aeruginosa/Pa_res_data.txt

#declare variables

FalseNegative=0
FalsePositive=0
TrueNegative=0
TruePositive=0

## Logic flow

# for each antibiotic; determine the following numbers

# false negative is a strain that is in the resistant list but called as sensitive

# false positive is a strain that is in the sensitive list but called as resistant

# true negative is a strain that is in the sensitive list and called as sensitive

# true positive is a strain that is in the resistant list and called as resistant

# Load the list of sensitive strains for each antibiotic

if [ -s Pipeline_False_Positives.txt ]; then
  rm Pipeline_False_Positives.txt
fi
if [ -s Pipeline_False_Negatives.txt ]; then
  rm Pipeline_False_Negatives.txt
fi


echo -e "Please enter the TLA for the antibiotic of interest or ALL to test everything in the current directory\n"
read Antibiotic
if [ "$Antibiotic" == "ALL" ]; then
 echo -e "Running across ALL antibiotics\n\n"
 echo -e "The data file for MIC profiles is located here --> $DATASET"
 echo -e "If this file is incorrect or you would like to use a different file please update this script"
 echo -e "Would you like to continue? Please type Y for yes or anything else to exit"
 read Continue
 if [ "$Continue" =! "Y" ]; then
   exit 0
 fi  
 
 #echo -e "Please enter the path to the resistance data file listing strains and profiles"
 SensitiveList=(`find $PWD/*_S.txt -printf "%f "`)
 NumSensitive=${#SensitiveList[@]}
 ResistantList=(`find $PWD/*_R.txt -printf "%f "`)
 NumResistant=${#ResistantList[@]}


 
 for (( i=0; i<NumSensitive; i++ )); do
  while read SensitiveStrain; do
  if [ ! -d "$PWD"/"$SensitiveStrain" ]; then
	  :
  else 
    grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$SensitiveStrain"_AbR_output.final.txt &> /dev/null
	status=$? 
	if [ "$status" == 0 ]; then #sensitive strain but called as resistant
	  FalsePositive=$((FalsePositive+1))
	else
      TrueNegative=$((TrueNegative+1)) #Sensitive strain not called as resistant	
	fi
  fi	
  done < ${SensitiveList[i]}
 done

 for (( i=0; i<NumResistant; i++ )); do
  while read ResistantStrain; do
    if [ ! -d "$PWD"/"$ResistantStrain" ]; then
	  :
	else  
      grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$ResistantStrain"_AbR_output.final.txt &> /dev/null
	  status=$? 
	  if [ "$status" == 0 ]; then #Resistant strain called as resistant
	    TruePositive=$((TruePositive+1))
	  else
        FalsePositive=$((FalseNegative+1)) #Resistant strain not called as resistant	
	  fi  
	fi
  done < ${ResistantList[i]}
 done
else


### Section for single antibiotic from here
 if [ ! -s "$Antibiotic"_R.txt ]; then
   echo "Cannot find file listing resistant strains"
   echo "I am looking for this file --> ${Antibiotic}_R.txt"
   echo "Please check and re-run"
   exit 1
 fi
 if [ ! -s "$Antibiotic"_S.txt ]; then
   echo "Cannot find file listing resistant strains"
   echo "I am looking for this file --> ${Antibiotic}_S.txt"
   echo "Please check and re-run"
   exit 1
 fi
 
 ##lookup Antibiotic name 
 
 RCount=$(cat "$Antibiotic"_R.txt |wc -l)
 SCount=$(cat "$Antibiotic"_S.txt | wc -l)
 if [ "$RCount" -gt "$SCount" ]; then 
  #echo "R > S"
  SingleStrain=$(head -n1 "$Antibiotic"_R.txt)
 else  
 #echo "S > R"
  SingleStrain=$(head -n1 "$Antibiotic"_R.txt)
 fi
 
 AntibioticFull=$(grep "$Antibiotic" $PWD/$SingleStrain/unique/drug.table.txt.backup | awk -F"," '{ print $2 }')
 
 echo -e "Running pipeline assessment for $Antibiotic\n\n"
 while read SensitiveStrain; do
  if [ ! -d $PWD/$SensitiveStrain ]; then
   echo -e "Cannot find strain ${SensitiveStrain}"
   echo -e "Please check and re-run"
   echo "Exiting"
   exit 1
  else 
  
    # echo -e "Testing $SensitiveStrain\n"
     ResistantOrSensitive=$(grep -w "$AntibioticFull" $PWD/$SensitiveStrain/unique/drug.table.txt | awk -F"," '{ print $4 }')
	 if [ "$ResistantOrSensitive" = Resistant ]; then #sensitive strain but called as resistant
	   FalsePositive=$((FalsePositive+1))
	   echo -e "$SensitiveStrain,False Positive for $AntibioticFull" >> Pipeline_False_Positives.txt
	   grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$SensitiveStrain"_AbR_output.final.txt >> Pipeline_False_Positives.txt
	   #if [ -s $PWD/$SensitiveStrain/unique/CARD/CARD_primary_output.txt ]; then
	    #grep -w "$Antibiotic" $PWD/$SensitiveStrain/unique/CARD/CARD_primary_output.txt >> Pipeline_False_Positives.txt
	   #fi
	   #echo -e "\n" >> Pipeline_False_Positives.txt
	 else
       TrueNegative=$((TrueNegative+1)) #Sensitive strain not called as resistant
       echo -e "$SensitiveStrain,True Negative for $Antibiotic" >> Pipeline_True_Negatives.txt	   
	 fi  
  fi
 done < "$Antibiotic"_S.txt



  while read ResistantStrain; do
    if [ ! -d $PWD/$ResistantStrain ]; then
	  echo -e "Cannot find strain ${ResistantStrain}"
      echo -e "Please check and re-run"
      echo "Exiting"
      exit 1
	else
     # echo -e "Testing $ResistantStrain\n"	
      ResistantOrSensitive=$(grep -w "$AntibioticFull" $PWD/$ResistantStrain/unique/drug.table.txt | awk -F"," '{ print $4 }')
	  if [ "$ResistantOrSensitive" = Resistant ]; then #Resistant strain called as resistant
	   TruePositive=$((TruePositive+1))
	   echo -e "$ResistantStrain,True Positive for $Antibiotic" >> Pipeline_True_Positives.txt
	  else
       FalseNegative=$((FalseNegative+1)) #Resistant strain not called as resistant	
	   echo -e "$ResistantStrain,False Negative for $Antibiotic" >> Pipeline_False_Negatives.txt
	  fi 
	fi  
  done < "$Antibiotic"_R.txt


fi

echo -e "Number of false negatives = $FalseNegative \n"
echo -e "Number of false positive = $FalsePositive \n"
echo -e "Number of true positives = $TruePositive \n"
echo -e "Number of true negatives = $TrueNegative \n"
TotalStrains=$(echo "$FalseNegative + $FalsePositive + $TruePositive + $TrueNegative" | bc)
echo -e "Total number of strains = $TotalStrains\n"
exit 0





