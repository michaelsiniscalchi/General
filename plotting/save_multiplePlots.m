function save_multiplePlots( figs, save_path, varargin )

opt_names = varargin;
options = parseOptions(opt_names);

for i = 1:numel(figs)
    
    if strcmp(class(figs(i)),'matlab.graphics.GraphicsPlaceholder')
        continue %Skip empty graphics placeholders
    end
    
    % Set CreateFcn callback
    figs(i).CreateFcn = 'set(gcbo,''Visible'',''on'')';
    
    %Create directory if necessary
    if ~exist(save_path,"dir")
        mkdir(save_path);
    end

    % Save PNG
    savename = fullfile(save_path, figs(i).Name);
    exportgraphics(figs(i),[savename '.png']); %Save PNG
    
    % Save SVG
    if options.svg
        orient(figs(i),'landscape')
        print(figs(i),savename,'-dsvg','-painters','-r0');    %Save vector for work in Illustrator
    end
    
    % Save PDF
    if options.pdf
        try
        %Make a copy so that size adjustments are not saved in FIG
        f = figure('Position',figs(i).Position);
        copyobj(figs(i).Children,f); 
        f.Colormap = figs(i).Colormap; %Preserve colormap
        %Adjust font sizes to 6pt for figure-making
        ax = findobj(f.Children,'Type','axes'); %List of axes
        for j=1:numel(ax)
            ax(j).FontSize = 6;
            %Adjust LineWidth to 1 pt
            lines = findobj(ax(j).Children,'Type','Line');
            for k = 1:numel(lines)
                if lines(k).LineWidth > 1
                    lines(k).LineWidth = 1;
                else lines(k).LineWidth = 0.5;
                end
            end
        end
        %Set orientation/size and print as PDF
        orient(f,'landscape'); 
        set(f,'PaperUnits','normalized');%,'PaperPosition',[0,0,1,1]);
        print(f,savename,'-dpdf','-painters','-r0','-bestfit');    %Save vector for work in Illustrator
        catch err
            warning(err.message);
        end
    end
    
    %Save as MATLAB .FIG file
    savefig(figs(i), savename, 'compact');
end
close all;

function options = parseOptions( opt_names )
options = struct('svg',false,'pdf',false);
for i = 1:numel(opt_names)
    options.(opt_names{i}) = true;
end

