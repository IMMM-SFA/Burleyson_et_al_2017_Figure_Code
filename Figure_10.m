% Figure_10.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 10 from Burleyson et al. 2017

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
load([data_input_dir,'Figure_10_Data.mat']);

T_Biases_Dummy = T_Biases; T_Biases_Dummy(:,1) = NaN.*0; T_Biases_Dummy(:,6) = NaN.*0;
Load_Biases_Dummy = Load_Biases; Load_Biases_Dummy(:,1) = NaN.*0; Load_Biases_Dummy(:,6) = NaN.*0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize'));

subplot(2,1,1); hold on;
for i = 1:size(T_Biases,1)
    line([1:1:6],T_Biases(i,1:6),'Color',[0.5 0.5 0.5],'LineWidth',0.5);
end
T_Boxes = boxplot([T_Biases_Dummy(:,:)]);
for i = 1:size(T_Boxes,1)
    set(T_Boxes(i,:),'LineWidth',4);
end
scatter(1,T_Biases(1,1),100,'r','filled'); scatter(6,T_Biases(1,6),100,'r','filled')
legend(['100x Repeated Additive Sampling'],'Location','NorthEast')
xlim([0.9 6.1]);
set(gca,'xtick',[1:1:6],'xticklabel',{'Class A','Class B','Class C','Class D','Class E','Class F'}); 
ylim([0 6]);
set(gca,'ytick',[0:1:15],'yticklabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'});
ylabel(['Temperature Bias [',setstr(176),'C]'],'FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.00,1.15,'(a)','FontSize',21,'Units','normalized');
title(['Temperature Biases for June-July-August 2010'],'FontSize',24)

subplot(2,1,2); hold on;
for i = 1:size(Load_Biases,1)
    line([1:1:6],Load_Biases(i,1:6),'Color',[0.5 0.5 0.5],'LineWidth',0.5);
end
Load_Boxes = boxplot([Load_Biases_Dummy(:,:)]);
for i = 1:size(Load_Boxes,1)
    set(Load_Boxes(i,:),'LineWidth',4);
end
scatter(1,Load_Biases(1,1),100,'r','filled'); scatter(6,Load_Biases(1,6),100,'r','filled');
xlim([0.9 6.1]);
set(gca,'xtick',[1:1:6],'xticklabel',{'Class A','Class B','Class C','Class D','Class E','Class F'}); 
ylim([0 20]);
set(gca,'ytick',[0:4:20],'yticklabel',{'0','4','8','12','16','20'});
ylabel(['Load Bias [%]'],'FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
text(0.00,1.15,'(b)','FontSize',21,'Units','normalized');
title(['Load Biases for June-July-August 2010'],'FontSize',24)

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_10.png']);
   close(a);
end
clear i a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir save_images T_Biases_Dummy Load_Biases_Dummy T_Boxes Load_Boxes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%