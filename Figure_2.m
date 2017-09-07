% Figure_2.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 2 from Burleyson et al. 2017. The data plotted are from 5-July 2008 at 20:00 UTC.

clear all; close all; warning off all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN USER INPUT SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save_images = 0;
data_input_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
image_output_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              END USER INPUT SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PROCESSING SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load the data file for the figure:
load([data_input_dir,'Figure_2_Data.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); 
subplot(4,6,[1 2 7 8 13 14]); hold on; 
ax1 = usamap([30 50],[-125 -102]); colormap(ax1,jet(50));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax1,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata_Vectors,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Data(i,11),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
scatterm(Data(:,8),Data(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[15,45]);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(a)','FontSize',27,'Units','normalized');
title('NLDAS','FontSize',24)

subplot(4,6,[3 4 9 10 15 16]); hold on; 
ax2 = usamap([30 50],[-125 -102]); colormap(ax2,jet(50));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax2,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata_Vectors,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Data(i,10),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
for i = 1:size(Metadata_Vectors,1); 
    linem([Data(i,2) Data(i,8)],[Data(i,3) Data(i,9)],'Color','k','LineWidth',0.25); 
end
scatterm(Data(:,8),Data(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[15,45]);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(b)','FontSize',27,'Units','normalized');
title('Representative Cities','FontSize',24)

subplot(4,6,[5 6 11 12 17 18]); hold on; 
ax3 = usamap([30 50],[-125 -102]); colormap(ax3,redblue(40));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax3,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata_Vectors,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Data(i,12),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
scatterm(Data(:,8),Data(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[-16,16]);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(c)','FontSize',27,'Units','normalized');
title('Rep. City - NLDAS','FontSize',24)

subplot(4,6,[19.5 21.5]); 
ax4 = gca; hold on; 
set(ax4,'clim',[15,45]); colormap(ax4,jet(50));
set(ax4,'xcolor','w'); set(ax4,'ycolor','w'); set(ax4,'ytick',[]); set(ax4,'xtick',[]);
colo = colorbar('xtick',[0:5:50],'xTickLabel',{'0','5','10','15','20','25','30','35','40','45','50'},'Location','NorthOutside');
set(get(colo,'xlabel'),'String',['County Temperature [',setstr(176),'C]'],'FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')

subplot(4,6,[23 24]); hold on; 
ax5 = gca; hold on; 
set(ax5,'clim',[-16,16]); colormap(ax5,redblue(40));
set(ax5,'xcolor','w'); set(ax5,'ycolor','w'); set(ax5,'ytick',[]); set(ax5,'xtick',[]);
colo = colorbar('xtick',[-20:5:20],'xTickLabel',{'-20','-15','-10','-5','0','+5','+10','+15','+20'},'Location','NorthOutside');
set(get(colo,'xlabel'),'String',['Temperature Bias [',setstr(176),'C]'],'FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r295',[image_output_dir,'Figure_2.png']);
   close(a);
end
clear a i ax1 ax2 ax3 ax4 ax5 colo states faceColors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir POline save_images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%