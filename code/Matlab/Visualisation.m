
clear all
close all

%% Visualisation
%GOAL:
% Generate filtered tracks for visualisation on a specific tck file
addpath('Weight');

Tracks_filename = fullfile("../../","Données","MG007","IIID","ROI_increase","INC4","Tracks.tck");
Weights_filename = fullfile("../../","Données","MG007","IIID","ROI_increase","INC4","FA_Weights.txt");
%Output_filename = fullfile("../../","Exemples","Filtrage","TEST1","Acendent_IIIG_fa_0.2.tck");
Output_Dir = fullfile("../../","Exemples","Filtrage","TEST4","Acendent_FA");
Weighted_Tracks = read_mrtrix_weight_tracks (Tracks_filename, Weights_filename);

Tracks = read_mrtrix_tracks (Tracks_filename);
Weighted_Tracks = rmfield(Weighted_Tracks,'roi');
Sorted_Tracks = sorting_tracks(Weighted_Tracks,'ascend');
%Tracks = rmfield(Tracks,'roi');
%write_mrtrix_tracks (Tracks, Output_filename)
Filtering_tracks(Sorted_Tracks,Output_Dir,20:20:100)
%write_mrtrix_weighted_tracks (Sorted_Tracks, Output_filename)
%% Functions
function Filtering_tracks(Sorted_Tracks,output_dir,percent)
    mkdir(output_dir)
    for i=1:length(percent)
        n=length(Sorted_Tracks.data)*percent(i)/100;
        Track = Sorted_Tracks;
        Track.data = Track.data(1:round(n));
        Track.weight = Track.weight(1:round(n));        
        write_mrtrix_weighted_tracks(Track, fullfile(output_dir,strcat("track_", string(percent(i)), ".tck")))
        %Construit un fichier de couleur
        Color = Track.weight;
        Color(:) = percent(i);
        writematrix(Color, fullfile(output_dir,strcat("Color_", string(percent(i)), ".txt")), 'Delimiter',' ')
    end
end
