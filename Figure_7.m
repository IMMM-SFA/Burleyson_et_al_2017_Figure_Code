% Figure_7.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 7 from Burleyson et al. 2017. The figure is plotted in multiple panels (seasons) which were then stiched together with an image editor.

clear all; close all; warning off all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN USER INPUT SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
season = 4; % (1 = DJF, 2 = MAM, 3 = JJA, 4 = SON)
save_images = 1;
data_input_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
image_output_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              END USER INPUT SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PROCESSING SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set the season and label specifications:
if season == 1
   season_string = 'DJF'; class_label_1 = 'a'; class_label_2 = 'e';
elseif season == 2
   season_string = 'MAM'; class_label_1 = 'b'; class_label_2 = 'f';
elseif season == 3
   season_string = 'JJA'; class_label_1 = 'c'; class_label_2 = 'g';
elseif season == 4
   season_string = 'SON'; class_label_1 = 'd'; class_label_2 = 'h';
end

% Load the data file for the figure:
load([data_input_dir,'Figure_7_Data_',season_string,'.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on; colormap(redblue(40));
subplot(4,6,[1 2 7 8]); class = 1;
ax1 = usamap([30 50],[-125 -102]); states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))}); faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax1,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1); 
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Mean_T_Bias(i,class),'FaceColor','flat'); 
end
geoshow(POline,'LineWidth',1,'Color','k');
scatterm(Metadata(:,8),Metadata(:,9),25,'filled','k')
set(gca,'clim',[-10,10]); tightmap; framem on; gridm off; mlabel off; plabel off; set(gca,'LineWidth',1.5,'FontSize',18,'Box','on')
title(['Class A - ',season_string],'FontSize',21); 
text(0.00,1.08,['(',class_label_1,')'],'FontSize',21,'Units','normalized');

subplot(4,6,[13 14 19 20]); class = 6;
ax2 = usamap([30 50],[-125 -102]); states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))}); faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax2,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1); 
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Mean_T_Bias(i,class),'FaceColor','flat'); 
end
geoshow(POline,'LineWidth',1,'Color','k');
set(gca,'clim',[-10,10]); tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on')
title(['Class F - ',season_string],'FontSize',21);
text(0.00,1.08,['(',class_label_2,')'],'FontSize',21,'Units','normalized');

if season == 4
   subplot(4,6,[3 9 15 21]); 
   ax3 = gca; hold on; 
   set(ax3,'clim',[-10,10]); colormap(ax3,redblue(40));
   set(ax3,'xcolor','w'); set(ax3,'ycolor','w'); set(ax3,'ytick',[]); set(ax3,'xtick',[]);
   colo = colorbar('ytick',[-20:5:20],'yTickLabel',{'-20','-15','-10','-5','0','+5','+10','+15','+20'},'Location','West');
   set(get(colo,'ylabel'),'String',['2007-2010 County Mean Temperature Bias [',setstr(176),'C]'],'FontSize',21);
   set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
end

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_7_',season_string,'.png']);
   close(a);
end
clear a ax1 ax2 ax3 faceColors i class class_label_1 class_label_2 colo states
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir save_images season POline season_string
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%