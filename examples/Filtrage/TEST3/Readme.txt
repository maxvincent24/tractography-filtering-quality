Patient: GF006
Nerve: NMG
Parametre: ROI_movLat
COndition: 1DIM1
Dice_max_FOD: 0.90
Index: 40
Dice_init: 0.56

---------------------------------------------------------------------------------------

mrview -load fa.mif -tractography.load Acendent/track_20.tck -tractography.load Acendent/track_40.tck -tractography.load Acendent/track_60.tck -tractography.load Acendent/track_80.tck -tractography.load Acendent/track_100.tck -tractography.load Ground_Truth.tck &


mrview -load fa.mif -tractography.load Acendent/track_100.tck --tractography.tsf_load Acendent/track_100_weight.txt &

mrview -load fa.mif -tractography.load Acendent_FOD/track_20.tck -tractography.load Acendent_FOD/track_40.tck -tractography.load Acendent_FOD/track_60.tck -tractography.load Acendent_FOD/track_80.tck -tractography.load Acendent_FOD/track_100.tck -tractography.load Ground_Truth.tck &

mrview -load fa.mif -tractography.load Acendent_FOD/track_100.tck --tractography.tsf_load Acendent_FOD/track_100_weight.txt &