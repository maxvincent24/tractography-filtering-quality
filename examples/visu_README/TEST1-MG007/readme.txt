








mrview -load fa.nii -tractography.load Tracks.tck --tractography.tsf_load FA_Weights.txt &

mrview -load fa.nii -tractography.load Ground_Truth.tck -tractography.load FA/track_20.tck -tractography.load FA/track_40.tck -tractography.load FA/track_60.tck -tractography.load FA/track_80.tck -tractography.load FA/track_100.tck -tractography.slab -1 -tractography.lighting 1 &



mrview -load fod.nii -tractography.load Tracks.tck --tractography.tsf_load FOD_Weights.txt &

mrview -load fod.nii -tractography.load Ground_Truth.tck -tractography.load FOD/track_20.tck -tractography.load FOD/track_40.tck -tractography.load FOD/track_60.tck -tractography.load FOD/track_80.tck -tractography.load FOD/track_100.tck -tractography.slab -1 -tractography.lighting 1 &


