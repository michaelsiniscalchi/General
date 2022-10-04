%Must add the repo '...\General\' to MATLAB path before running (or save in Set Path settings)
function addGitRepo(dirs, varargin)
% function dirs = addGitRepo(dirs, varargin)
% dirs = getRoots();
for i = 1:numel(varargin)
    repo_directory = fullfile(dirs.code,varargin{i});
    if exist(repo_directory,"dir")
    addpath(genpath(repo_directory));
    rmpath(genpath(fullfile(repo_directory,'.git')));
    disp(['Adding Search Path: ' repo_directory '...']);
    end
end