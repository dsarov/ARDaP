#! /bin/bash

#echo -e "This script will determine the rate of false positives, false negatives, true positive and true negatives following a complete ARDaP run.\n\n"

# The script requires the following files

DATASHEET=/home/dsarovich2/bin/ARDaP/Databases/Pseudomonas_aeruginosa/Pa_res_data.txt

Antibiotic="$1"

#declare variables

FalseNegative=0
FalsePositive=0
TrueNegative=0
TruePositive=0
IntermediateNegative=0
IntermediatePositive=0
No_R_strains=0
No_S_strains=0
No_I_strains=0
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
if [ -s Pipeline_False_Intermediate_Positives.txt ]; then
  rm Pipeline_False_Intermediate_Positives.txt
fi
if [ -s Pipeline_False_Intermediate_Negatives.txt ]; then
  rm Pipeline_False_Intermediate_Negatives.txt
fi  

#echo -e "Please enter the TLA for the antibiotic of interest or ALL to test everything in the current directory\n"
#read Antibiotic
#if [ "$Antibiotic" == "ALL" ]; then
# echo -e "Running across ALL antibiotics\n\n"
 #echo -e "The data file for MIC profiles is located here --> $DATASET"
 #echo -e "If this file is incorrect or you would like to use a different file please update this script"
 #echo -e "Would you like to continue? Please type Y for yes or anything else to exit"
 #read Continue
 #if [ "$Continue" =! "Y" ]; then
 #  exit 0
 #fi  
 
 #echo -e "Please enter the path to the resistance data file listing strains and profiles"

### Section for single antibiotic from here
if [ ! -s "$Antibiotic"_R.txt ]; then
   echo "Cannot find file listing resistant strains" >> Summary_log.txt
   echo "I am looking for this file --> ${Antibiotic}_R.txt" >> Summary_log.txt
   echo "I'm assuming that there are zero resistant strains." >> Summary_log.txt
   echo "If that isn't the case then this error should be fixed." >> Summary_log.txt
   No_R_strains=1
fi
if [ ! -s "$Antibiotic"_S.txt ]; then
   echo "Cannot find file listing sensitive strains" >> Summary_log.txt
   echo "I am looking for this file --> ${Antibiotic}_S.txt" >> Summary_log.txt
   echo "I'm assuming that there are zero sensitive strains." >> Summary_log.txt
   echo "If that isn't the case then this error should be fixed." >> Summary_log.txt
   No_S_strains=1
fi
if [ ! -s "$Antibiotic"_I.txt ]; then
   echo "Cannot find file listing Intermediate strains" >> Summary_log.txt
   echo "I am looking for this file --> ${Antibiotic}_I.txt" >> Summary_log.txt
   echo "I'm assuming that there are zero intermediate resistance strains." >> Summary_log.txt
   echo "If that isn't the case then this error should be fixed." >> Summary_log.txt
   No_I_strains=1
fi
 ##lookup Antibiotic name 
if [ "$No_R_strains" = 0 ]; then
	RCount=$(cat "$Antibiotic"_R.txt | wc -l)
fi
if [ "$No_S_strains" = 0 ]; then
	SCount=$(cat "$Antibiotic"_S.txt | wc -l)
fi
if [ "$No_I_strains" = 0 ]; then
	ICount=$(cat "$Antibiotic"_I.txt | wc -l)
fi

echo "Number of resistant strains=$RCount" >> Summary_log.txt
echo "Number of sensitive strains=$SCount" >> Summary_log.txt
echo "Number of intermediate strains=$ICount" >> Summary_log.txt

#echo "stdbuf -oL grep -w \"$Antibiotic\" $PWD/*/unique/drug.table.txt.backup | head -n1 | awk -F\",\" '{ print \$2 }'"

AntibioticFull=$(stdbuf -oL grep -w "$Antibiotic" $PWD/*/unique/drug.table.txt.backup | head -n1 | awk -F"," '{ print $2 }')
echo "$AntibioticFull" >> Summary_log.txt

echo -e "$Antibiotic"
if [ "$No_S_strains" = 0 ]; then
  while read SensitiveStrain; do
	if [ ! -d "$PWD"/"$SensitiveStrain" ]; then
		echo -e "Cannot find strain ${SensitiveStrain}"
		echo -e "Please check and re-run"
		echo "Exiting"
		exit 1
	else 
		#echo -e "Testing sensitivity for $SensitiveStrain\n"
		ResistantOrSensitive=$(grep -w "$AntibioticFull" $PWD/$SensitiveStrain/unique/drug.table.txt | awk -F"," '{ print $4 }')
		if [ "$ResistantOrSensitive" = Resistant ]; then #sensitive strain but called as resistant
			FalsePositive=$((FalsePositive+1))
			echo -e "$SensitiveStrain,False Positive for $AntibioticFull" >> Pipeline_False_Positives.txt
			grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$SensitiveStrain"_AbR_output.final.txt >> Pipeline_False_Positives.txt
	        #if [ -s $PWD/$SensitiveStrain/unique/CARD/CARD_primary_output.txt ]; then
			#grep -w "$Antibiotic" $PWD/$SensitiveStrain/unique/CARD/CARD_primary_output.txt >> Pipeline_False_Positives.txt
			#fi
			#echo -e "\n" >> Pipeline_False_Positives.txt
		elif [ "$ResistantOrSensitive" = Sensitive ]; then
			TrueNegative=$((TrueNegative+1)) #Sensitive strain not called as resistant
			echo -e "$SensitiveStrain,True Negative for $Antibiotic" >> Pipeline_True_Negatives.txt
		elif [ "$ResistantOrSensitive" = Intermediate ]; then
			#echo -e "$SensitiveStrain,False Intermediate Positive for $AntibioticFull" >> Pipeline_False_Positives.txt
			#grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$SensitiveStrain"_AbR_output.final.txt >> Pipeline_False_Positives.txt
			#FalsePositive=$((FalsePositive+1))
			echo -e "$SensitiveStrain,False Intermediate Positive for $Antibiotic" >> Pipeline_False_Intermediate_Positives.txt
			IntermediatePositive=$((IntermediatePositive+1))
		fi
	fi
  done < "$Antibiotic"_S.txt
fi

if [ "$No_R_strains" = 0 ]; then
  while read ResistantStrain; do
    if [ ! -d "$PWD"/"$ResistantStrain" ]; then
		echo -e "Cannot find strain ${ResistantStrain}"
		echo -e "Please check and re-run"
		echo "Exiting"
		exit 1
	else
		#echo -e "Testing resistance for $ResistantStrain\n"	
		ResistantOrSensitive=$(grep -w "$AntibioticFull" $PWD/$ResistantStrain/unique/drug.table.txt | awk -F"," '{ print $4 }')
		if [ "$ResistantOrSensitive" = Resistant ]; then #Resistant strain called as resistant
			TruePositive=$((TruePositive+1))
			echo -e "$ResistantStrain,True Positive for $Antibiotic" >> Pipeline_True_Positives.txt
		elif [ "$ResistantOrSensitive" = Sensitive ]; then
			FalseNegative=$((FalseNegative+1)) #Resistant strain not called as resistant	
			echo -e "$ResistantStrain,False Negative for $Antibiotic" >> Pipeline_False_Negatives.txt
		elif [ "$ResistantOrSensitive" = Intermediate ]; then
		    IntermediateNegative=$((IntermediateNegative+1))
			echo -e "$ResistantStrain,False Intermediate Negative for $Antibiotic" >> Pipeline_False_Intermediate_Negatives.txt
			grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$ResistantStrain"_AbR_output.final.txt >> Pipeline_False_Intermediate_Negatives.txt
		fi
	fi  
  done < "$Antibiotic"_R.txt
fi

if [ "$No_I_strains" = 0 ]; then
  while read IntermediateStrain; do
    if [ ! -d "$PWD"/"$IntermediateStrain" ]; then
		echo -e "Cannot find strain ${IntermediateStrain}"
		echo -e "Please check and re-run"
		echo "Exiting"
		exit 1
	else
		#echo -e "Testing intermediate resistance for $IntermediateStrain\n"	
		ResistantOrSensitive=$(grep -w "$AntibioticFull" $PWD/$IntermediateStrain/unique/drug.table.txt | awk -F"," '{ print $4 }')
		if [ "$ResistantOrSensitive" = Resistant ]; then #Intermediate strain called as resistant
			echo -e "$IntermediateStrain,False Intermediate Negative for $AntibioticFull" >> Pipeline_False_Intermediate_Positives.txt
			grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$SensitiveStrain"_AbR_output.final.txt >> Pipeline_False_Intermediate_Positives.txt
			IntermediatePositive=$((IntermediatePositive+1))
		elif [ "$ResistantOrSensitive" = Sensitive ]; then
			IntermediateNegative=$((IntermediateNegative+1))
			echo -e "$IntermediateStrain,False Intermediate Negative for $AntibioticFull" >> Pipeline_False_Intermediate_Negative.txt
			grep -w "$Antibiotic" "$PWD"/Outputs/AbR_reports/"$SensitiveStrain"_AbR_output.final.txt >> Pipeline_False_Intermediate_Negative.txt
		elif [ "$ResistantOrSensitive" = Intermediate ]; then
			TruePositive=$((TruePositive+1)) 
		fi
	fi  
  done < "$Antibiotic"_I.txt
fi  
  
echo -e "$FalseNegative"
echo -e "$FalsePositive"
echo -e "$TruePositive"
echo -e "$TrueNegative"
echo -e "$IntermediatePositive"
echo -e "$IntermediateNegative"
TotalStrains=$(echo "$FalseNegative + $FalsePositive + $TruePositive + $TrueNegative + $IntermediatePositive + $IntermediateNegative" | bc)
echo -e "$TotalStrains"
exit 0

