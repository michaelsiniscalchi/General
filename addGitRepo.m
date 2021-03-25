%Must add the repo '...\General\' to MATLAB path before running (or save in Set Path settings)

function dirs = addGitRepo(varargin)
dirs = getRoots();
for i = 1:numel(varargin)
    repo_directory = fullfile(dirs.code,varargin{i});
    addpath(genpath(repo_directory));
end