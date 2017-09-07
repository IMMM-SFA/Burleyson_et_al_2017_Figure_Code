% Figure_12.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 12 from Burleyson et al. 2017

clear all; close all; warning off all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN USER INPUT SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save_images = 1;
data_input_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
image_output_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              END USER INPUT SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PROCESSING SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load the data file for the figure:
load([data_input_dir,'Figure_12_Data.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); 
subplot(4,6,[1 2 7 8 13 14]); hold on; 
ax1 = usamap([30 50],[-125 -102]); colormap(ax1,jet(40));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax1,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Data(i,1),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
set(gca,'clim',[15.6,37.8]);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.00,1.08,'(a)','FontSize',21,'Units','normalized');
title(['NLDAS: ',num2str(roundn(Peak(1,1),-1)),setstr(176),'C'],'FontSize',24)
clear i ax1 faceColors

subplot(4,6,[3 4 9 10 15 16]); hold on; 
ax2 = usamap([30 50],[-125 -102]); colormap(ax2,jet(40));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax2,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Data(i,2),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
for i = 1:size(Metadata,1); 
    linem([Metadata(i,2) Metadata(i,7)],[Metadata(i,3) Metadata(i,8)],'Color','k','LineWidth',0.25); 
end
scatterm(Metadata(:,7),Metadata(:,8),15,'filled','MarkerFaceColor','k')
set(gca,'clim',[15.6,37.8]);
tightmap; framem on; gridm off; mlabel off; plabel off;
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.00,1.08,'(b)','FontSize',21,'Units','normalized');
title(['Class A: ',num2str(roundn(Peak(1,2),-1)),setstr(176),'C'],'FontSize',24)
clear i ax2 faceColors

subplot(4,6,[5 6 11 12 17 18]); hold on; 
ax3 = usamap([30 50],[-125 -102]); colormap(ax3,jet(40));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax3,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Data(i,3),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
for i = 1:size(Metadata,1); 
    linem([Metadata(i,2) Metadata(i,7)],[Metadata(i,10) Metadata(i,11)],'Color','k','LineWidth',0.25); 
end
scatterm(Metadata(:,10),Metadata(:,11),15,'filled','MarkerFaceColor','k')
set(gca,'clim',[15.6,37.8]);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.00,1.08,'(c)','FontSize',21,'Units','normalized');
title(['Class F: ',num2str(roundn(Peak(1,3),-1)),setstr(176),'C'],'FontSize',24)
clear i ax3 faceColors

subplot(4,6,[19.5 23.5]); 
ax4 = gca; hold on; 
set(ax4,'clim',[15.6,37.8]); colormap(ax4,jet(40));
set(ax4,'xcolor','w'); set(ax4,'ycolor','w'); set(ax4,'ytick',[]); set(ax4,'xtick',[]);
colo = colorbar('xtick',[0:5:50],'xTickLabel',{'0','5','10','15','20','25','30','35','40','45','50'},'Location','NorthOutside');
set(get(colo,'xlabel'),'String',['Mean Temperature for the Hottest 5-Day Period in 2008 [',setstr(176),'C]'],'FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
clear ax4 colo

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r295',[image_output_dir,'Figure_12.png']);
   close(a);
end
clear a ax1 ax2 ax3 ax4 colo faceColors states
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir save_images POline Metadata_Vectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%