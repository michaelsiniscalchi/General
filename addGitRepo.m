%%% addGitRepo(dirs, varargin)
% 
% PURPOSE: Add list of git repositories to the MATLAB path.
% AUTHORS: MJ Siniscalchi, PNI, 210317
%
% Note: must add the repo '...\General\' to MATLAB path before running (or save in Set Path settings)
%---------------------------------------------------------------------------------------------------

function dirs = addGitRepo(dirs, varargin)

for i = 1:numel(varargin)
    repo_directory = fullfile(dirs.code, varargin{i});
    if exist(repo_directory,"dir")
    addpath(genpath(repo_directory));
    rmpath(genpath(fullfile(repo_directory,'.git')));
    disp(['Adding Search Path: ' repo_directory '...']);
    end
end