function dirs = getRoots()

name = getenv('COMPUTERNAME');
switch name
    case 'STELLATE'
        dirs.root = fullfile('J:','Data & Analysis');
        dirs.code = fullfile('J:','Documents','GitHub');
    case 'PNI-F4W2YM2'
        dirs.root = fullfile('C:','Data');
        dirs.code = fullfile('C:','Users','mjs20','Documents','GitHub');
end