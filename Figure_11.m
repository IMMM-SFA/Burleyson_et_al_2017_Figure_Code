% Figure_11.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 11 from Burleyson et al. 2017

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
load([data_input_dir,'Figure_11_Data.mat']);

IE_Load_Biases_Dummy = IE_Load_Biases; IE_Load_Biases_Dummy(:,1) = NaN.*0; IE_Load_Biases_Dummy(:,6) = NaN.*0; 
ST_Load_Biases_Dummy = ST_Load_Biases; ST_Load_Biases_Dummy(:,1) = NaN.*0; ST_Load_Biases_Dummy(:,6) = NaN.*0;
PZ_Load_Biases_Dummy = PZ_Load_Biases; PZ_Load_Biases_Dummy(:,1) = NaN.*0; PZ_Load_Biases_Dummy(:,6) = NaN.*0;
BA_Load_Biases_Dummy = BA_Load_Biases; BA_Load_Biases_Dummy(:,1) = NaN.*0; BA_Load_Biases_Dummy(:,6) = NaN.*0;

for column = 1:6
    Median_Load_Biases(1,column) = nanmedian(IE_Load_Biases(:,column));
    Median_Load_Biases(2,column) = nanmedian(ST_Load_Biases(:,column));
    Median_Load_Biases(3,column) = nanmedian(PZ_Load_Biases(:,column));
    Median_Load_Biases(4,column) = nanmedian(BA_Load_Biases(:,column));
end
clear column
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on;
line([1 1.85 2.85 3.85 4.85 6],Median_Load_Biases(1,:),'Color','r','LineWidth',3);
line([1 1.95 2.95 3.95 4.95 6],Median_Load_Biases(2,:),'Color','m','LineWidth',3);
line([1 2.05 3.05 4.05 5.05 6],Median_Load_Biases(3,:),'Color','b','LineWidth',3);
line([1 2.15 3.15 4.15 5.15 6],Median_Load_Biases(4,:),'Color','c','LineWidth',3);
IE_Load_Boxes = boxplot([IE_Load_Biases_Dummy(:,:)],'Colors','r','Positions',[1 1.85 2.85 3.85 4.85 6],'Widths',0.08);
ST_Load_Boxes = boxplot([ST_Load_Biases_Dummy(:,:)],'Colors','m','Positions',[1 1.95 2.95 3.95 4.95 6],'Widths',0.08);
PZ_Load_Boxes = boxplot([PZ_Load_Biases_Dummy(:,:)],'Colors','b','Positions',[1 2.05 3.05 4.05 5.05 6],'Widths',0.08);
BA_Load_Boxes = boxplot([BA_Load_Biases_Dummy(:,:)],'Colors','c','Positions',[1 2.15 3.15 4.15 5.15 6],'Widths',0.08);
set(findobj(IE_Load_Boxes,'Tag','Outliers'),'MarkerEdgeColor','r','MarkerSize',5);
set(findobj(ST_Load_Boxes,'Tag','Outliers'),'MarkerEdgeColor','m','MarkerSize',5);
set(findobj(PZ_Load_Boxes,'Tag','Outliers'),'MarkerEdgeColor','b','MarkerSize',5);
set(findobj(BA_Load_Boxes,'Tag','Outliers'),'MarkerEdgeColor','c','MarkerSize',5);
for i = 1:size(IE_Load_Boxes,1)
    set(IE_Load_Boxes(i,:),'LineWidth',3,'Color','r');
    set(ST_Load_Boxes(i,:),'LineWidth',3,'Color','m');
    set(PZ_Load_Boxes(i,:),'LineWidth',3,'Color','b');
    set(BA_Load_Boxes(i,:),'LineWidth',3,'Color','c');
end
scatter([1 6],[nanmean(IE_Load_Biases(:,1)) nanmean(IE_Load_Biases(:,6))],100,'r','filled');
scatter([1 6],[nanmean(ST_Load_Biases(:,1)) nanmean(ST_Load_Biases(:,6))],100,'m','filled');
scatter([1 6],[nanmean(PZ_Load_Biases(:,1)) nanmean(PZ_Load_Biases(:,6))],100,'b','filled');
scatter([1 6],[nanmean(BA_Load_Biases(:,1)) nanmean(BA_Load_Biases(:,6))],100,'c','filled');
legend('IECC Climate Zones','States','PROMOD Zones','Balancing Authorities','Location','North','Orientation','Horizontal')
xlim([0.8 6.20]);
set(gca,'xtick',[1:1:6],'xticklabel',{'Class A','Class B','Class C','Class D','Class E','Class F'}); 
ylim([0 60]);
set(gca,'ytick',[0:10:100],'yticklabel',{'0','10','20','30','40','50','60','70','80','90','100'});
ylabel(['Maximum Root-Mean-Squared Load Bias [%]'],'FontSize',18);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
title(['Maximum Load Biases for June-July-August 2010'],'FontSize',24)
if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_11.png']);
   close(a);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear a data_input_dir i image_output_dir save_images BA_Load_Biases_Dummy IE_Load_Biases_Dummy PZ_Load_Biases_Dummy ST_Load_Biases_Dummy
clear BA_Load_Boxes IE_Load_Boxes PZ_Load_Boxes ST_Load_Boxes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%