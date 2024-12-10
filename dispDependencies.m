clear all;
[fList,pList] = matlab.codetools.requiredFilesAndProducts('cellROI.m');
disp({pList(:).Name}');