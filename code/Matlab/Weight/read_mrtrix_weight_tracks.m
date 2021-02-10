function weighted_tracks = read_mrtrix_weight_tracks (tracks_filename, weight_filename)

weighted_tracks = read_mrtrix_tracks (tracks_filename);
fid = fileread(weight_filename);
format long
cell_data= textscan(fid,'%f');
weighted_tracks.weight = transpose(cell_data{1,1});
end
