function cbrew = brewColorSwatches(nSeries)

if nargin<1
    nSeries = 11;
end

c = cbrewer('qual','Paired',10); c2 = cbrewer('qual','Set1',9);
cbrew = struct(...
    'red',c(6,:),'red2',c(5,:),'blue',c(2,:),'blue2',c(1,:),'green',c(4,:),'green2',c(3,:),...
    'purple',c(10,:),'purple2',c(9,:),'orange',c(8,:),'orange2',c(7,:),'pink',c2(8,:),...
    'black',[0,0,0],'white',[1,1,1],'gray',c2(9,:));

%Colorseries for input to colororder()
C = cbrewer('qual','Set1',nSeries);
yellowIdx = all(C(:,1:2)==1, 2);
grayIdx = diff(C,2,2)==0;
cbrew.series = C(~(yellowIdx|grayIdx),:);

% --- Visualize color palette ---
% figure
% colormap(cbrew.series);
% imagesc(1:size(cbrew.series,1));