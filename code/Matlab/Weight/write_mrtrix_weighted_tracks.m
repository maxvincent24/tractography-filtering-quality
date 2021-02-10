function write_mrtrix_weighted_tracks (tracks, filename)
weight = tracks.weight;
tracks = rmfield(tracks,'weight');
write_mrtrix_tracks (tracks, filename)
weight_filename = strcat(erase(filename,'.tck'),'_weight.txt');
writematrix(weight,weight_filename, 'Delimiter',' ')
end