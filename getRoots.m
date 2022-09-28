function dirs = getRoots()

disp('Getting root and code directories...');

name = getenv('COMPUTERNAME');
if isempty(name)
    %For Linux clusters
    disp('No COMPUTERNAME found.')
    name = getenv('HOSTNAME');
end

switch name
    %Home PC
    case 'STELLATE'
        dirs.root = fullfile('J:','Data & Analysis');
        dirs.code = fullfile('J:','Documents','GitHub');
    case 'PNI-F4W2YM2'
        %PNI Desktop
        dirs.root = fullfile('C:','Data');
        dirs.code = fullfile('C:','Users','mjs20','Documents','GitHub');
    case 'spock-login.pni.Princeton.EDU'
        %Spock
        disp(['Using HOSTNAME: ' name]);
        dirs.root = fullfile('jukebox','Bezos','Michael','_network batch');
%         dirs.code = fullfile('jukebox','Bezos','Michael','_code');
dirs.code = fullfile('cup.pni.princeton.edu','Bezos-center','Michael','_code');
end

disp(['   Root: ' dirs.root]);
disp(['   Code: ' dirs.code]);