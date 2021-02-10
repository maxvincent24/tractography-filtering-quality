function [tab,idx] = WeightedTrack2Array(tracks_filename, weight_filename, order)
    weighted_tracks = read_mrtrix_weight_tracks (tracks_filename, weight_filename);
    [~,idx] = sort(weighted_tracks.weight,order);
    tab=weighted_tracks.data;

        for i=1:length(tab) % solve problem mrtrix coords at 0 and nii_reader flip
            tab{i}(:,3) = abs(tab{i}(:,3)) + 1;
            tab{i}(:,2) = 129 - tab{i}(:,2);
            tab{i}(:,1) = 129 - tab{i}(:,1);
        end
end