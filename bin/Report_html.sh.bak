#!/bin/bash

speciestmp=$1

species=${speciestmp/_/ }

#grab the variables from the patientmetadata.csv
ID=$(awk -F"," '{ print $1 }' patientMetaData.csv |tail -n1)
Barcode=$(awk -F"," '{ print $2 }' patientMetaData.csv |tail -n1)
LName=$(awk -F"," '{ print $3 }' patientMetaData.csv |tail -n1)
FName=$(awk -F"," '{ print $4 }' patientMetaData.csv |tail -n1)
DOB=$(awk -F"," '{ print $5 }' patientMetaData.csv |tail -n1)
Location=$(awk -F"," '{ print $6 }' patientMetaData.csv |tail -n1)
sampType=$(awk -F"," '{ print $7 }' patientMetaData.csv |tail -n1)
sampID=$(awk -F"," '{ print $8 }' patientMetaData.csv |tail -n1)
sampDate=$(awk -F"," '{ print $9 }' patientMetaData.csv |tail -n1)
sampSource=$(awk -F"," '{ print $10 }' patientMetaData.csv |tail -n1)
sampSeq=$(awk -F"," '{ print $11 }' patientMetaData.csv |tail -n1)
reportLab=$(awk -F"," '{ print $12 }' patientMetaData.csv |tail -n1)
reportDate=$(awk -F"," '{ print $13 }' patientMetaData.csv |tail -n1)
comments=$(awk -F"," '{ print $14 }' patientMetaData.csv |tail -n1)
organism=$(awk -F"," '{ print $15 }' patientMetaData.csv |tail -n1)
requestor=$(awk -F"," '{ print $16 }' patientMetaData.csv |tail -n1)
requestorContact=$(awk -F"," '{ print $17 }' patientMetaData.csv |tail -n1)
lineageNum=$(awk -F"," '{ print $18 }' patientMetaData.csv |tail -n1)
lineageName=$(awk -F"," '{ print $19 }' patientMetaData.csv |tail -n1)

#Predicted to be resistant to?

res_list=($(awk -F"," '$4 ~ /[Rr]esistant/ ' patientDrugSusceptibilityData.csv | awk -F"," '$2!~/[Ii]ntrinsic/' | awk -F"," '{print $3}'))

resistant_list="${res_list[@]/%/,}"
#echo to file and then change last comma to .
echo "${resistant_list[@]}" > list_tmp
sed -i 's/,$/./' list_tmp
resistant_drugs=$(cat list_tmp)


#no drug, some drug or all drug?
no_resist="${#res_list[@]}"
echo "${no_resist[@]}"
echo "$resistant_drugs"

if [ "$no_resist" -eq 0 ]; then #no drug resistance
  no_res="&#9745;"
  one_res="&#9744;"
  two_res="&#9744;"
  multi_res="&#9744;"
  resistant_drugs="no clinically relevant antibiotics"
fi
if [ "$no_resist" -eq 1 ]; then #resistant to one drug
  no_res="&#9744;"
  one_res="&#9745;"
  two_res="&#9744;"
  multi_res="&#9744;"
fi  
if [ "$no_resist" -eq 2 ]; then #no drug resistance
  no_res="&#9744;"
  one_res="&#9744;"
  two_res="&#9745;"
  multi_res="&#9744;"
fi
if [ "$no_resist" -gt 2 ]; then #no drug resistance
  no_res="&#9744;"
  one_res="&#9744;"
  two_res="&#9744;"
  multi_res="&#9745;"
fi
#count the number of first and second line drugs

declare -A f_line_table_more=()
declare -A s_line_table_more=()

noFirstLine=$(awk -F"," '$2 ~ /[Ff]irst-line/ ' patientDrugSusceptibilityData.csv | wc -l)
noSecondLine=$(awk -F"," '$2 ~ /[Ss]econd-line/ ' patientDrugSusceptibilityData.csv | wc -l)
noTertiary=$(awk -F"," '$2 ~ /[Tt]ertiary/ ' patientDrugSusceptibilityData.csv | wc -l)
noIntrinsic=$(awk -F"," '$2 ~ /[Ii]ntrinsic/ ' patientDrugSusceptibilityData.csv | wc -l)


#Format of patientDrugSusceptibilityData.csv is as follows
# Col 1 "ID" # Col 2 "Class" # Col 3 "Drug" # Col 4 "Status" # Col 5 "Details" 


#array the first-line drugs
readarray -t f_line_drug < <( awk -F"," '$2 ~ /[Ff]irst-line/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $3}')
readarray -t s_line_drug < <( awk -F"," '$2 ~ /[Ss]econd-line/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $3}')

#array first and second line resistant and senstitive calls
readarray -t f_line_resistance < <( awk -F"," '$2 ~ /[Ff]irst-line/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $4}')
readarray -t s_line_resistance < <( awk -F"," '$2 ~ /[Ss]econd-line/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $4}')

readarray -t f_line_mech < <( awk -F"," '$2 ~ /[Ff]irst-line/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $5}')
readarray -t s_line_mech < <( awk -F"," '$2 ~ /[Ss]econd-line/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $5}')



#first line
if [ "$noFirstLine" -eq 1 ]; then
first_line_table=$(cat <<EOF
<tr>
<td rowspan="$noFirstLine">First-line</td>
<td>${f_line_resistance[0]}</td>
<td>${f_line_drug[0]}</td>
<td>${f_line_mech[0]}</td>
</tr>
EOF
)
elif [ "$noFirstLine" -gt 1 ]; then
first_line_table=$(cat <<EOF
<tr>
<td rowspan="$noFirstLine">First-line</td>
<td>${f_line_resistance[0]}</td>
<td>${f_line_drug[0]}</td>
<td>${f_line_mech[0]}</td>
</tr>
EOF
)
for (( i=1; i<"$noFirstLine"; i++ )); do
f_line_table_more[$i]=$(
cat <<EOF
<tr>
<td>${f_line_resistance[$i]}</td>
<td>${f_line_drug[$i]}</td>
<td>${f_line_mech[$i]}</td>
</tr>
EOF
)
done
fi

#second line
if [ "$noSecondLine" -eq 1 ]; then
second_line_table=$(cat <<EOF
<tr>
<td rowspan="$noSecondLine">Second-line</td>
<td>${s_line_resistance[0]}</td>
<td>${s_line_drug[0]}</td>
<td>${s_line_mech[0]}</td>
</tr>
EOF
)
elif [ "$noSecondLine" -gt 1 ]; then
second_line_table=$(cat <<EOF
<tr>
<td rowspan="$noSecondLine">Second-line</td>
<td>${s_line_resistance[0]}</td>
<td>${s_line_drug[0]}</td>
<td>${s_line_mech[0]}</td>
</tr>
EOF
)
for (( i=1; i<"$noSecondLine"; i++ )); do
s_line_table_more[$i]=$(
cat <<EOF
<tr>
<td>${s_line_resistance[$i]}</td>
<td>${s_line_drug[$i]}</td>
<td>${s_line_mech[$i]}</td>
</tr>
EOF
)
done
fi


#Array tertiary drugs
if [ "$noTertiary" -gt 0 ]; then
  readarray -t t_line_drug < <( awk -F"," '$2 ~ /[Tt]ertiary/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $3}')
  readarray -t t_line_resistance < <( awk -F"," '$2 ~ /[Tt]ertiary/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $4}')
  readarray -t t_line_mech < <( awk -F"," '$2 ~ /[Tt]ertiary/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $5}')

####populate tertiary variable
if [ "$noTertiary" -eq 1 ]; then
tertiary_line_table=$(cat <<EOF
<tr>
<td rowspan="$noTertiary">Tertiary</td>
<td>${t_line_resistance[0]}</td>
<td>${t_line_drug[0]}</td>
<td>${t_line_mech[0]}</td>
</tr>
EOF
)
elif [ "$noTertiary" -gt 1 ]; then
tertiary_line_table=$(cat <<EOF
<tr>
<td rowspan="$noTertiary">Tertiary</td>
<td>${t_line_resistance[0]}</td>
<td>${t_line_drug[0]}</td>
<td>${t_line_mech[0]}</td>
</tr>
EOF
)
for (( i=1; i<"$noTertiary"; i++ )); do
t_line_table_more[$i]=$(
cat <<EOF
<tr>
<td>${t_line_resistance[$i]}</td>
<td>${t_line_drug[$i]}</td>
<td>${t_line_mech[$i]}</td>
</tr>
EOF
)
done
fi
fi

#Array intrinsic drugs
if [ "$noIntrinsic" -gt 0 ]; then
  readarray -t i_line_drug < <( awk -F"," '$2 ~ /[Ii]ntrinsic/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $3}')
  readarray -t i_line_resistance < <( awk -F"," '$2 ~ /[Ii]ntrinsic/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $4}')
  readarray -t i_line_mech < <( awk -F"," '$2 ~ /[Ii]ntrinsic/ ' patientDrugSusceptibilityData.csv | awk -F"," '{print $5}')

####populate intrinsic variable
if [ "$noIntrinsic" -eq 1 ]; then
intrinsic_line_table=$(cat <<EOF
<tr>
<td rowspan="$noIntrinsic">Intrinsic </td>
<td>${i_line_resistance[0]}</td>
<td>${i_line_drug[0]}</td>
<td>${i_line_mech[0]}</td>
</tr>
EOF
)
elif [ "$noIntrinsic" -gt 1 ]; then
intrinsic_line_table=$(cat <<EOF
<tr>
<td rowspan="$noIntrinsic">Intrinsic</td>
<td>${i_line_resistance[0]}</td>
<td>${i_line_drug[0]}</td>
<td>${i_line_mech[0]}</td>
</tr>
EOF
)
for (( i=1; i<"$noIntrinsic"; i++ )); do
i_line_table_more[$i]=$(
cat <<EOF
<tr>
<td>${i_line_resistance[$i]}</td>
<td>${i_line_drug[$i]}</td>
<td>${i_line_mech[$i]}</td>
</tr>
EOF
)
done
fi
fi

#Format Abr_report file for importation into html report

awk -F"|" '$4 ~ /[Nn]one/ ' ${sampID}.AbR_output.final.txt > natural_variation.txt
awk -F"|" '$4 !~ /[Nn]one/ ' ${sampID}.AbR_output.final.txt > resistance_determinants.txt

sed -i 's/>/\&gt;/g' resistance_determinants.txt
sed -i 's/</\&lt;/g' resistance_determinants.txt
sed -i 's/≥/\&#8925;/g' resistance_determinants.txt
sed -i 's/µ/\&#181;/g' resistance_determinants.txt
sed -i 's/≤/\&#8804;/g' resistance_determinants.txt
sed -i 's/^/<tr><td WIDTH="100%">/g' resistance_determinants.txt
sed -i 's/$/<\/td><\/tr>/g' resistance_determinants.txt


sed -i 's/>/\&gt;/g' natural_variation.txt
sed -i 's/</\&lt;/g' natural_variation.txt
sed -i 's/≥/\&#8925;/g' natural_variation.txt
sed -i 's/µ/\&#181;/g' natural_variation.txt
sed -i 's/≤/\&#8804;/g' natural_variation.txt
sed -i 's/^/<tr><td WIDTH="100%">/g' natural_variation.txt
sed -i 's/$/<\/td><\/tr>/g' natural_variation.txt

abr_report=$(cat resistance_determinants.txt)
natural_variation=$(cat natural_variation.txt)

#Format for speciation report
awk -F"|" -v f="speciation" 'BEGIN{IGNORECASE=1} $4~ f' ${sampID}.AbR_output.final.txt > speciation.txt
sed -i 's/^/<tr><td WIDTH="100%">/g' speciation.txt
sed -i 's/$/<\/td><\/tr>/g' speciation.txt
speciation=$(cat speciation.txt)

cat <<_EOF_ > "$ID"_report.html

<style>

table.detail_table {
  border: 1px solid #000000;
  background-color: #FFFFFF;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.detail_table td, table.detail_table th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.detail_table tbody td {
  font-size: 15px;
}
table.detail_table td:nth-child(even) {
  background: #E2E2E2;
}
table.detail_table thead {
  background: #535353;
  background: -moz-linear-gradient(top, #7e7e7e 0%, #646464 66%, #535353 100%);
  background: -webkit-linear-gradient(top, #7e7e7e 0%, #646464 66%, #535353 100%);
  background: linear-gradient(to bottom, #7e7e7e 0%, #646464 66%, #535353 100%);
  border-bottom: 2px solid #444444;
}
table.detail_table thead th {
  font-size: 16px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: left;
  border-left: 2px solid #545454;
}
table.detail_table thead th:first-child {
  border-left: none;
}

table.detail_table tfoot td {
  font-size: 14px;
}
</style>

<img src="data:image/png;base64,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" style="float:right;width:225px;height:180px;">

<P style="font-size:30px">${species^^}</P>
<P style="font-size:30px">GENOME SEQUENCING REPORT</P>
<P style="font-size:20px">NOT FOR DIAGNOSTIC USE</P>

<table class="detail_table">
<tbody>
<tr>
<td>Patient Name</td>
<td>$FName $LName</td>
<td>Barcode</td>
<td>$Barcode</td>
</tr>
<tr>
<td>Birth Date</td>
<td>$DOB</td>
<td>Patient ID</td>
<td>$ID</td>
</tr>
<tr>
<td>Location</td>
<td>$Location</td>
<td>Sample Type</td>
<td>$sampType</td>
</tr>
<tr>
<td>Sample Source</td>
<td>$sampSource</td>
<td>Sample Date</td>
<td>$sampDate</td>
</tr>
<tr>
<td>Sample ID</td>
<td>$sampID</td>
<td>Sequenced From</td>
<td>$sampSeq</td>
</tr>
<tr>
<td>Reporting Lab</td>
<td>$reportLab</td>
<td>Report Date/Time</td>
<td>$reportDate</td>
</tr>
<tr>
<td>Requested By</td>
<td>$requestor</td>
<td>Requestor Contact</td>
<td>$requestorContact</td>
</tr>
</tbody>
</table>
<br>
<br>
<table class="detail_table">
<thead>
<tr>
<th>Summary</th>
</tr>
</thead>
<tbody>
<tr>
<td>The specimen was interogated with the <em>${species}</em> database</td>
</tr>
<tr>
<td>It is predicted to be resistant to ${resistant_drugs}</td>
</tr>
</tbody>
</table>
<br>
<br>
<style>
table.drug_suscep {
    border: 1px solid #AAAAAA;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.drug_suscep td, table.drug_suscep th {
border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.drug_suscep tbody td {
border: 1px solid #AAAAAA;
  font-size: 16px;
}
table.drug_suscep tr:nth-child(even) {
border: 1px solid #AAAAAA;
  background: #D1D1D1;
}
table.drug_suscep thead {
  background: #535353;
  background: -moz-linear-gradient(top, #7e7e7e 0%, #646464 66%, #535353 100%);
  background: -webkit-linear-gradient(top, #7e7e7e 0%, #646464 66%, #535353 100%);
  background: linear-gradient(to bottom, #7e7e7e 0%, #646464 66%, #535353 100%);
  border: 1px solid #AAAAAA;
}
table.drug_suscep thead th {
  font-size: 16px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: left;
  border-left: 2px solid #545454;
}
table.drug_suscep thead th:first-child {
  border: 1px solid #AAAAAA;
}

table.drug_suscep tfoot td {
border: 1px solid #AAAAAA;
  font-size: 16px;
}
</style>

<table class="drug_suscep">
<thead>
<tr>
<th colspan="4">Drug Susceptibility</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2">Resistance is reported when a high-confidence resistance conferring mutation is detected. "No mutation detected" does not exclude the possibility of resistance</td>
<td colspan="2"><table class="minimalistBlack">
<style>
table.minimalistBlack {
  border: 1px solid #AAAAAA;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.minimalistBlack td, table.minimalistBlack th {
  padding: 3px 2px;
}
table.minimalistBlack tbody td {
  font-size: 16px;
}
table.minimalistBlack tr:nth-child(even) {
  background: #D1D1D1;
}
table.minimalistBlack tfoot td {
  font-size: 16px;
}

</style>
<tbody>
<tr>
<td>$no_res</td>
<td>No drug resistance predicted</td>
</tr>
<tr>
<td>$one_res</td>
<td>Mono-resistance predicted</td>
</tr>
<tr>
<td>$two_res</td>
<td>Multi-drug resistance predicted</td>
</tr>
<tr>
<td>$multi_res</td>
<td>Extensive drug resistance predicted</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td WIDTH="25%">Drug class</td>
<td WIDTH="25%">Interpretation</td>
<td WIDTH="25%">Drug</td>
<td WIDTH="25%">Resistance determinant</td>
</tr>
$first_line_table
${f_line_table_more[@]}
$second_line_table
${s_line_table_more[@]}

</tbody>
</table>
<br>

<table class="drug_suscep">
<thead>
<tr>
<th colspan="4">Extended/non-clinical drug susceptibility</th>
</tr>
</thead>
<tbody>
<tr>
<td WIDTH="25%">Drug class</td>
<td WIDTH="25%">Interpretation</td>
<td WIDTH="25%">Drug</td>
<td WIDTH="25%">Resistance determinant</td>
</tr>
$tertiary_line_table
${t_line_table_more[@]}
</tbody>
</table>
<br>
<table class="drug_suscep">
<thead>
<tr>
<th colspan="4">Intrinsic drug resistance/unusual drug susceptibility</th>
</tr>
</thead>
<tbody>
<tr>
<td WIDTH="25%">Drug class</td>
<td WIDTH="25%">Interpretation</td>
<td WIDTH="25%">Drug</td>
<td WIDTH="25%">Mechanism of sensitivity</td>
</tr>
$intrinsic_line_table
${i_line_table_more[@]}
</tbody>
</table>
<br>
</tbody>
</table>
<br>

<table class="detail_table">
<thead>
<tr>
<th colspan="4">Antimicrobial determinant details</th>
</tr>
</thead>
<tbody>
$abr_report
</tbody>
</table>

</tbody>
</table>
<br>
<table class="detail_table">
<thead>
<tr>
<th colspan="4">Natural variation that does not confer antimicrobial resistance</th>
</tr>
</thead>
<tbody>
$natural_variation
</tbody>
</table>

<br>

</tbody>
</table>
<br>
<table class="detail_table">
<thead>
<tr>
<th colspan="4">Speciation and quality control reporting</th>
</tr>
</thead>
<tbody>
$speciation
</tbody>
</table>

<br>

<TABLE cellpadding=0 cellspacing=0 class="t2">
<TR>
	<TD class="tr1 td56"><P class="p3 ft1">Page 1 of 1</P></TD>
	<TD class="tr1 td57"><P class="p3 ft1">Patient ID: $ID | Date: $reportDate | Location: $Location</P></TD>

_EOF_