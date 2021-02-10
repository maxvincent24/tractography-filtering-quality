%%
clear all
close all
clc

%%
% Add folders to path

addpath('New Code');
addpath('Conversion');
addpath('Entropy');
addpath('Evaluation');
addpath('Filtering');
addpath('Geometry');
addpath('Geometry/Partition/eq_partitions');
addpath('Geometry/Partition/eq_point_set_props');
addpath('Geometry/Partition/eq_region_props');
addpath('Geometry/Partition/eq_utilities');
addpath('Viewpoint');
addpath('Codegen');



fileList = getAllFolders('../Data')
for i = 1:length(fileList)
    myfile = fileList(i)
    % Path to the nerve
    myfile = char(strcat(fileList(i), '/Tracks_vox.tck'))
    if exist(myfile, 'file') == 2;
        % Compute the entropy matrix
        [E_NF, bounds_NF, pix_NF] = entropy_matrix(myfile, [129,129,27], [3 3 3]);
        % Filter the nerve with percentages p and write the result in the result
        %folder
        resultsfolder = append(char(strrep(fileList(i), 'Data', 'Results')), '/')      
        p = 0:10:100;
        [fib, ind] = filter_nerve(myfile, pix_NF, E_NF, p, resultsfolder);
    else;
        fprintf('This is folder does not contain a Voxel coordinates file')
    end
end
