function sorted_tracks = sorting_tracks(weighted_tracks,order)

    [out,idx] = sort(weighted_tracks.weight,order);
    s_data = cell(size(weighted_tracks.data));
    s_weight = cell(size(weighted_tracks.weight));

    for i=1:length(out)
        s_data{i} = weighted_tracks.data{idx(i)};
        s_weight{i} = weighted_tracks.weight(idx(i));
    end
    
    sorted_tracks = weighted_tracks;
    sorted_tracks.data = s_data;
    sorted_tracks.weight = cell2mat(s_weight);
end