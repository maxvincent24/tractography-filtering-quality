% Goal:
% Generate SD values and max_SD dataframe for the filtering method using
% FOD

clear all
close all


addpath('Weight');


Data_dir_name = '../../data';
Max_array = {'Patient','Nerve','Parametre','Condition','Dice_max','Index', 'Threshold', 'Dice_init', 'Methode'};
n=2;
percent = 1:1:100;
files = dir(Data_dir_name);
directoryNames = {files([files.isdir]).name};
directoryNames = directoryNames(~ismember(directoryNames,{'.','..'}));


for i = 1:length(directoryNames)
    
    Patient = directoryNames{i};
    Patient_dir_name = fullfile(Data_dir_name,Patient);
    files2 = dir(Patient_dir_name);
    directoryNames2 = {files2([files2.isdir]).name};
    directoryNames2 = directoryNames2(~ismember(directoryNames2,{'.','..'}));
    
    for j = 1:length(directoryNames2)
        
        Nerve = directoryNames2{j};
        Nerve_dir_name = fullfile(Patient_dir_name,Nerve);
        Ref_file_name = fullfile(Nerve_dir_name,'Ground_Truth_vox.tck')  
        files3 = dir(Nerve_dir_name);
        directoryNames3 = {files3([files3.isdir]).name};
        directoryNames3 = directoryNames3(~ismember(directoryNames3,{'.','..'}));
        
        for k = 1:length(directoryNames3)
            Param = directoryNames3{k};
            Param_dir_name = fullfile(Nerve_dir_name,Param);
            files4 = dir(Param_dir_name);
            directoryNames4 = {files4([files4.isdir]).name};
            directoryNames4 = directoryNames4(~ismember(directoryNames4,{'.','..'}));
            
            for l = 1:length(directoryNames4)
                
                Name =directoryNames4{l};               
                Weights_file_name = fullfile(Param_dir_name,Name,'FOD_Weights.txt');
                Tracks_file_name = fullfile(Param_dir_name,Name,'Tracks_vox.tck');
                w=dir(Weights_file_name);
                t=dir(Tracks_file_name);
                r=dir(Ref_file_name);
                SD=zeros(1,length(percent));
                if isempty(w) || isempty(t) || isempty(r) || w.bytes ==0  
                    %empty files
                else
                     SD = Dice_from_weighted_tracks(Ref_file_name, Tracks_file_name, Weights_file_name, percent,'ascend');
                     weighted_tracks = read_mrtrix_weight_tracks (Tracks_file_name, Weights_file_name);
                    [wght,~] = sort(weighted_tracks.weight,'ascend');
                end
                
                [val,idx] = max(SD);
                thresh = wght(ceil(length(wght)*idx/100));
                Max_array{n,1} = Patient;
                Max_array{n,2} = Nerve;
                Max_array{n,3} = Param;
                Max_array{n,4} = Name;
                Max_array{n,5} = val;
                Max_array{n,6} = idx;
                Max_array{n,7} = thresh;
                Max_array{n,8} = SD(100);
                Max_array{n,9} = "FOD";
                n=n+1;
                
                %save dice resilts:
                writematrix(SD,fullfile(Param_dir_name,Name,'Dice_FA_Filltering.csv')) 
                
            end
        end
    end
end

T = cell2table(Max_array(2:end,:),'VariableNames',Max_array(1,:));
%Save max_SD dataframe
writetable(T,"../../table_results/FOD_Dice_Array.csv")