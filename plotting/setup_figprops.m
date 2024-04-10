%%% setup_figprops()
%PURPOSE:   Setup plotting properties for variety of figures
%AUTHORS:   MJ Siniscalchi & AC Kwan 191010

function setup_figprops(type)

%General preferences
set(groot, ...
    'DefaultFigurePosition',[100 100 800 400],... %LBWH
    'DefaultFigurePaperPositionMode','auto',...
    'DefaultFigureColor','w',...
    'DefaultAxesLineWidth', 1,...
    'DefaultAxesTickLength', [0.005 0.005],...
    'DefaultAxesXColor', 'k', ...
    'DefaultAxesYColor', 'k', ...
    'DefaultAxesFontUnits', 'points', ...
    'DefaultAxesFontSize', 14, ...
    'DefaultAxesFontName', 'Helvetica', ...
    'DefaultAxesFontSmoothing','on',...
    'DefaultAxesBox', 'off',...
    'DefaultTiledLayoutTileSpacing', 'none',...
    'DefaultTiledLayoutPadding', 'none',...
    'DefaultBarLineWidth', 1,...
    'DefaultTextFontUnits', 'Points',...
    'DefaultTextFontSize', 14, ...
    'DefaultTextFontName', 'Arial',...
    'DefaultLineLineWidth',2);

% For specific figure types
if strcmp(type,'raster')
    set(groot,...
        'DefaultLineLineWidth', 1,...
        'DefaultFigurePosition',[50 85 800 800]); %LBWH
elseif strcmp(type,'timeseries')
    set(groot,...
        'DefaultFigurePosition',[400 100 600 300]); %LBWH
    
elseif strcmp(type,'heatmap')
    set(groot,...
        'DefaultFigurePosition',[100,100,1600,800],... %LBWH
        'DefaultAxesLineWidth', 1,...
        'DefaultAxesXColor', 'k', ...
        'DefaultLineLineWidth', 1);
end