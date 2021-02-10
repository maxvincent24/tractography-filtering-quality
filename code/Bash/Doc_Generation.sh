#!/bin/bash
mkdir ../Données
var1=$(ls ../../Data)
for el in $var1
do
 if [[ $el != *"."* ]]; then
 #mkdir ../Données/$el
  echo "$el"
  var2=$(ls ../../Data/$el/Tractography/non\ expert)


  for el2 in $var2
  do
   
   if [[ $el2 != *"."* ]]; then
   #mkdir ../Données/$el/$el2
    echo "	$el2"
    
    var3=$(ls ../../Data/$el/Tractography/non\ expert/$el2/)
    #cp ../../Data/$el/Tractography/expert/vox_coords/${el2}_vox.tck ../Données/$el/$el2/Ground_Truth_vox.tck
    #cp ../../Data/$el/Tractography/expert/real_coords/${el2}.tck ../Données/$el/$el2/Ground_Truth.tck
    
    for el3 in $var3
    do
    #mkdir ../Données/$el/$el2/$el3
     echo "		$el3"
     var4=$(ls ../../Data/$el/Tractography/non\ expert/$el2/$el3)      


     for el4 in $var4
     do
      if [[ $el4 != *"vox"* ]] && [[ $el4 == *".tck"* ]]; then
       var5=${el4//.tck}
       var6=${var5//$el2}
       echo "			$var6"
       cp ../../Experiments/FA_Weights/$el/$el2/$el3/out_weights${var6}.txt     ../Données/$el/$el2/$el3/$var6/FA_Weights.txt
       cp ../../Experiments/FOD_Weights/$el/$el2/$el3/out_weights${var6}.txt     ../Données/$el/$el2/$el3/$var6/FOD_Weights.txt
       #cp ../../Data/$el/Tractography/non\ expert/$el2/$el3/$el4 ../Données/$el/$el2/$el3/$var6/Tracks.tck
       #cp ../../Data/$el/Tractography/non\ expert/$el2/$el3/vox$el4 ../Données/$el/$el2/$el3/$var6/Tracks_vox.tck
       #mkdir ../Données/$el/$el2/$el3/$var6
       #mkdir Weight/$el/$el2/$el3/
      fi
     done
    done


   fi
  done


 fi
done