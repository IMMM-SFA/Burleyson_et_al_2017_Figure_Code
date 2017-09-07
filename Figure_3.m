% Figure_3.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 3 Burleyson et al. 2017. The figure is plotted in multiple panels which were then stiched together with an image editor.

clear all; close all; warning off all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN USER INPUT SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save_images = 1;
panel = 1;
data_input_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
image_output_dir = 'C:\Users\burl878\Documents\Research\Papers\2017_Burleyson_et_al_A\Submissions\Revision_C\Data\Figures\';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              END USER INPUT SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PROCESSING SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if panel == 1
   Upper_Class_Label = 'a'; Upper_Class_Text = 'A'; Lower_Class_Label = 'd'; Lower_Class_Text = 'D';
elseif panel == 2
   Upper_Class_Label = 'b'; Upper_Class_Text = 'B'; Lower_Class_Label = 'e'; Lower_Class_Text = 'E';
elseif panel == 3
   Upper_Class_Label = 'c'; Upper_Class_Text = 'C'; Lower_Class_Label = 'f'; Lower_Class_Text = 'F';
end
load([data_input_dir,'Figure_3_Panel_',panel,'.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); 
subplot(4,6,[1 2 7 8]); hold on; colormap(jet(8));
ax = usamap([30 50],[-125 -102]); states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))}); faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(WECC_Metadata,1)
    patchm(WECC_Metadata(i,1).Latitude_Vector,WECC_Metadata(i,1).Longitude_Vector,0,'FaceVertexCData',Upper_Metadata_Table(i,15),'FaceColor','flat')
end
for i = 1:size(WECC_Metadata,1)
    linem([Upper_Metadata_Table(i,2) Upper_Metadata_Table(i,16)],[Upper_Metadata_Table(i,3) Upper_Metadata_Table(i,17)],'Color','k','LineWidth',0.25)
end
geoshow(POline,'LineWidth',1,'Color','k'); scatterm(Upper_EPW_Sites(:,2),Upper_EPW_Sites(:,3),35,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[1,9]); tightmap; framem on; gridm off; mlabel off; plabel off; set(gca,'LineWidth',1.5,'FontSize',18,'Box','on')
title(['Class ',Upper_Class_Text],'FontSize',21); text(0.00,1.08,['(',Upper_Class_Label,')'],'FontSize',21,'Units','normalized'); clear ax faceColors i 

subplot(4,6,[13 14 19 20]); hold on; colormap(jet(8));
ax = usamap([30 50],[-125 -102]); states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))}); faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(WECC_Metadata,1)
    patchm(WECC_Metadata(i,1).Latitude_Vector,WECC_Metadata(i,1).Longitude_Vector,0,'FaceVertexCData',Lower_Metadata_Table(i,15),'FaceColor','flat')
end
for i = 1:size(WECC_Metadata,1)
    linem([Lower_Metadata_Table(i,2) Lower_Metadata_Table(i,16)],[Lower_Metadata_Table(i,3) Lower_Metadata_Table(i,17)],'Color','k','LineWidth',0.25)
end
geoshow(POline,'LineWidth',1,'Color','k'); scatterm(Lower_EPW_Sites(:,2),Lower_EPW_Sites(:,3),35,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[1,9]); tightmap; framem on; gridm off; mlabel off; plabel off; set(gca,'LineWidth',1.5,'FontSize',18,'Box','on')
title(['Class ',Lower_Class_Text],'FontSize',21); text(0.00,1.08,['(',Lower_Class_Label,')'],'FontSize',21,'Units','normalized'); clear ax faceColors i

subplot(4,6,[3 9 15 21]); 
ax5 = gca; hold on; 
set(ax5,'clim',[1,9]); colormap(jet(8));
set(ax5,'xcolor','w'); set(ax5,'ycolor','w'); set(ax5,'ytick',[]); set(ax5,'xtick',[]);
colo = colorbar('ytick',[1.5:1:8.5],'yTickLabel',{'2B','3B','3C','4B','4C','5B','6B','7B'},'Location','West');
set(get(colo,'ylabel'),'String',['IECC Climate Zones'],'FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
clear ax5 colo

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_3_Panel_',panel,'.png']);
   close(a);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear a class data_input_dir image_output_dir panel POline save_images states
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%