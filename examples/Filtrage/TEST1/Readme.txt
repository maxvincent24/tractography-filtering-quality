Patient:BF009 
Nerve:IIIG
Parameter:FA
Condition:fa_02
Dice_max(FA_ascend): 0.89059501
Index: 56
Dice_init: 0.65047233

---------------------------------------------------------------------------------------

Mrtrix Command:

mrview -load fa.nii -tractography.load Acendent_IIIG_fa_0.2.tck --tractography.tsf_load Acendent_IIIG_fa_0.2_weight.txt


mrview -load fa.nii -tractography.load Acendent/track_20.tck -tractography.load Acendent/track_40.tck -tractography.load Acendent/track_60.tck -tractography.load Acendent/track_80.tck -tractography.load Acendent/track_100.tck &

mrview -load fa.nii -tractography.load Acendent/track_100.tck --tractography.tsf_load Acendent/track_100_weight.txt &