% Figure_1.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 1 Burleyson et al. 2017

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
load([data_input_dir,'Figure_1_Data.mat']);

% Do some manipulation to the IECC climate zones in order to make the colobar easier to plot by removing unecessary data:
Metadata(:,11) = NaN.*0;
Metadata(find(Metadata(:,6) == 3),11)  = 1; % IECC Climate Zone: 2B
Metadata(find(Metadata(:,6) == 5),11)  = 2; % IECC Climate Zone: 3B
Metadata(find(Metadata(:,6) == 6),11)  = 3; % IECC Climate Zone: 3C
Metadata(find(Metadata(:,6) == 8),11)  = 4; % IECC Climate Zone: 4B
Metadata(find(Metadata(:,6) == 9),11)  = 5; % IECC Climate Zone: 4C
Metadata(find(Metadata(:,6) == 11),11) = 6; % IECC Climate Zone: 5B
Metadata(find(Metadata(:,6) == 13),11) = 7; % IECC Climate Zone: 6B
Metadata(find(Metadata(:,6) == 15),11) = 8; % IECC Climate Zone: 7B

% Do some manipulation to the WECC PROMOD zones in order to make the colobar easier to plot by removing unecessary data:
Metadata(:,12) = NaN.*0;
Metadata(find(Metadata(:,5) == 2),12)   = 1;  % PROMOD Zone: AZ-PV
Metadata(find(Metadata(:,5) == 5),12)   = 2;  % PROMOD Zone: CA-Bay
Metadata(find(Metadata(:,5) == 6),12)   = 3;  % PROMOD Zone: CA-N
Metadata(find(Metadata(:,5) == 7),12)   = 4;  % PROMOD Zone: CA-SCE
Metadata(find(Metadata(:,5) == 8),12)   = 5;  % PROMOD Zone: CA-SDGE
Metadata(find(Metadata(:,5) == 9),12)   = 6;  % PROMOD Zone: CA-ZP26
Metadata(find(Metadata(:,5) == 10),12)  = 7;  % PROMOD Zone: CenVal
Metadata(find(Metadata(:,5) == 11),12)  = 8;  % PROMOD Zone: CO-East
Metadata(find(Metadata(:,5) == 12),12)  = 9;  % PROMOD Zone: CO-West
Metadata(find(Metadata(:,5) == 13),12)  = 10; % PROMOD Zone: Idaho
Metadata(find(Metadata(:,5) == 14),12)  = 11; % PROMOD Zone: IID
Metadata(find(Metadata(:,5) == 15),12)  = 12; % PROMOD Zone: LADWP
Metadata(find(Metadata(:,5) == 16),12)  = 13; % PROMOD Zone: Montana
Metadata(find(Metadata(:,5) == 17),12)  = 14; % PROMOD Zone: NM
Metadata(find(Metadata(:,5) == 18),12)  = 15; % PROMOD Zone: NNev
Metadata(find(Metadata(:,5) == 19),12)  = 16; % PROMOD Zone: NW-Mid-C
Metadata(find(Metadata(:,5) == 20),12)  = 17; % PROMOD Zone: SNev
Metadata(find(Metadata(:,5) == 21),12)  = 18; % PROMOD Zone: Utah
Metadata(find(Metadata(:,5) == 22),12)  = 19; % PROMOD Zone: WY

% Convert the population data to millions of people:
Metadata(:,4) = Metadata(:,4)./1000000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); 
subplot(1,2,1); hold on; 
ax1 = usamap([30 50],[-125 -102]); colormap(ax1,jet(8));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax1,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Metadata(i,11),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
scatterm(Metadata(:,8),Metadata(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[1,9]);
colo = colorbar('ytick',[1.5:1:8.5],'YTickLabel',{'2B','3B','3C','4B','4C','5B','6B','7B'});
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(a)','FontSize',27,'Units','normalized');
title('IECC Climate Zones','FontSize',24)

subplot(1,2,2); hold on;
ax2 = usamap([30 50],[-125 -102]); colormap(ax2,jet(19));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax2,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Metadata(i,12),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
scatterm(Metadata(:,8),Metadata(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[1,20]);
colo = colorbar('ytick',[1.5:1:19.5],'YTickLabel',{'AZ-PV','CA-Bay','CA-N','CA-SCE','CA-SDGE','CA-ZP26','CenVal','CO-East','CO-West','Idaho','IID','LADWP','Montana','NM','NNev','NW-Mid-C','SNev','Utah','WY'}); 
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(b)','FontSize',27,'Units','normalized');
title('PROMOD Zones','FontSize',24)

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r295',[image_output_dir,'Figure_1_A.png']);
   close(a);
end
clear a i ax1 ax2 faceColors states colo



a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on; 
subplot(1,2,1); hold on; 
ax1 = usamap([30 50],[-125 -102]); colormap(ax1,jet(5));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax1,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Metadata(i,10),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
scatterm(Metadata(:,8),Metadata(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5)
set(gca,'clim',[0.5,5.5]); colorbar
colo = colorbar('ytick',[1:1:5],'YTickLabel',{'1','2','3','4','5'}); 
set(get(colo,'ylabel'),'String',{'CBECS/RECS Climate Regions'},'FontSize',18);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(c)','FontSize',27,'Units','normalized');
title('CBECS/RECS Climate Regions','FontSize',24)

subplot(1,2,2); hold on;
ax2 = usamap([30 50],[-125 -102]); colormap(ax2,LCH_Spiral(64,1,180,1,[90 25]));
states = shaperead('usastatelo','UseGeoCoords',true,'Selector',{@(name)~any(strcmp(name,{'Alaska','Hawaii'})),'Name'});
faceColors = makesymbolspec('Polygon',{'INDEX',[1 numel(states)],'FaceColor',polcmap(numel(states))});
faceColors.FaceColor{1,3} = faceColors.FaceColor{1,3}./faceColors.FaceColor{1,3};
geoshow(ax2,states,'DisplayType','polygon','SymbolSpec',faceColors,'LineWidth',1,'LineStyle','-')
for i = 1:size(Metadata,1)
    patchm(Metadata_Vectors(i,1).Latitude_Vector,Metadata_Vectors(i,1).Longitude_Vector,0,'FaceVertexCData',Metadata(i,4),'FaceColor','flat')
end
geoshow(POline,'LineWidth',1,'Color','k');
for i = 1:size(Metadata,1); 
    linem([Metadata(i,2) Metadata(i,8)],[Metadata(i,3) Metadata(i,9)],'Color','k','LineWidth',0.25); 
end
scatterm(Metadata(:,8),Metadata(:,9),50,'filled','MarkerFaceColor','w','MarkerEdgeColor','k','LineWidth',1.5);
set(gca,'clim',[0,2.5]);
colo = colorbar('ytick',[0:0.25:2.55],'YTickLabel',{'0.00','0.25','0.50','0.75','1.00','1.25','1.50','1.75','2.00','2.25','>2.50'}); 
set(get(colo,'ylabel'),'String',{'2014 Population [*10^6 People]'},'FontSize',18);
tightmap; framem on; gridm off; mlabel off; plabel off; 
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.035,0.10,'(d)','FontSize',27,'Units','normalized');
title('Population','FontSize',24)

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r295',[image_output_dir,'Figure_1_B.png']);
   close(a);
end
clear a i ax1 ax2 faceColors states colo
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