function dirs = getRoots()

disp('Getting root and code directories...');

name = getenv('COMPUTERNAME');
if isempty(name)
    %For Linux clusters
    name = getenv('HOSTNAME');
    if regexp(name,'spock')
        name = 'spock';
    end
end
disp(['Host: ' name]);

switch name
    %Home PC
    case 'STELLATE'
%         dirs.root = fullfile('J:','Data & Analysis');
        dirs.root = fullfile('X:','michael');
        dirs.code = fullfile('J:','Documents','GitHub');
    case 'PNI-F4W2YM2'
        %Olde PNI Desktop
        dirs.code = fullfile('C:','Users','mjs20','Documents','GitHub');
        dirs.root = fullfile('X:','michael');
    case 'PNI-1S7LK74'
        %New PNI Desktop
        dirs.code = fullfile('C:','Users','mjs20','Documents','GitHub');
        dirs.root = fullfile('X:','michael');
    case {'spock', 'scotty.pni.princeton.edu'}
        %Spock & Scotty: code on Bezos server
        dirs.root = fullfile('/jukebox','witten','michael');
        dirs.code = fullfile('/jukebox','Bezos','michael','_code');
end

disp(['   Root: ' dirs.root]);
disp(['   Code: ' dirs.code]);