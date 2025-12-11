function [tapVolume, addVolume] = calcWaterTemp(finalVolume, finalTemp, tapTemp, addTemp)

if nargin<4
    addTemp=212;
end

%tapVolume + addVolume = finalVolume;
%tapTemp*tapVolume + addTemp*addVolume = finalTemp*finalVolume;

%Ax = B form
%[1, 1; tapTemp, addTemp]*[tapVolume; addVolume] = [finalVolume; finalTemp*finalVolume];
A = [1, 1; tapTemp, addTemp];
B = [finalVolume; finalTemp*finalVolume];
%Solve with back-division operator: A\B := inv(A)*B
X = A\B;
tapVolume = X(1);
addVolume = X(2);


