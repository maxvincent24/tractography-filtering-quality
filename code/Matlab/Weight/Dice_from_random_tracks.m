function SD = Dice_from_random_tracks(refnerve, tracks, percent)

% import ref

ref = tracks2array(refnerve);
% import tracto and weight

tab = tracks2array(tracks);
% filter 
idx = randperm(length(tab));
[~, ind] = filter_weight_fib_abs (tab, idx, percent);

% mask
mask = zeros([129,129,27]) +1;
mask_ref = apply_mask(mask, ref);

% Dice
[ref_ind, ~] = ref_index(mask_ref, tab, false); 
% Compute Sorensen_Dice quality score 
SD = quality_score(ref_ind, ind);
end