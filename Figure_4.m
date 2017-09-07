% Figure_4.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 4 from Burleyson et al. 2017

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
load([data_input_dir,'Figure_4_Data.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             END PRE-PROCESSING SECTION              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PROCESSING SECTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on;
subplot(2,2,1); hold on
scatter(CO_East_Data(:,7),CO_East_Data(:,8),25,'k')
line(CO_East_Fit(1,:),CO_East_Fit(2,:),'Color','c','LineWidth',3)
scatter(CO_East_Statistics(1,1),CO_East_Statistics(1,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(CO_East_Statistics(2,1),CO_East_Statistics(2,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
scatter(CO_East_Statistics(3,1),CO_East_Statistics(3,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(CO_East_Statistics(4,1),CO_East_Statistics(4,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
legend('Observed','Fit','Location','North')
xlim([(min(CO_East_Data(:,7))-5) (max(CO_East_Data(:,7))+5)]);
set(gca,'xtick',[-20:10:120],'xticklabel',{'-20','-10','0','10','20','30','40','50','60','70','80','90','100','110','120'}); 
xlabel(['Zone Mean Representative City Temperature [',setstr(176),'C]'],'FontSize',18);
ylim([(min(CO_East_Data(:,8))-50) (max(CO_East_Data(:,8))+50)]);
ylabel('Net BEND Load [MW]','FontSize',18);
set(gca,'LineWidth',1.5,'FontSize',15,'Box','on','Layer','top')
text(0.00,1.12,'(a)','FontSize',21,'Units','normalized');
title('CO-East','FontSize',24)

subplot(2,2,2); hold on
scatter(LADWP_Statistics(1,1),LADWP_Statistics(1,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',0.1)
scatter(LADWP_Statistics(2,1),LADWP_Statistics(2,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',0.1)
scatter(LADWP_Data(:,7),LADWP_Data(:,8),25,'k')
line(LADWP_Fit(1,:),LADWP_Fit(2,:),'Color','c','LineWidth',3)
scatter(LADWP_Statistics(1,1),LADWP_Statistics(1,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(LADWP_Statistics(2,1),LADWP_Statistics(2,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
scatter(LADWP_Statistics(3,1),LADWP_Statistics(3,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(LADWP_Statistics(4,1),LADWP_Statistics(4,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
legend('2.5/97.5 Percentile Representative City','2.5/97.5 Percentile NLDAS','Location','NorthWest')
xlim([(min(LADWP_Data(:,7))-5) (max(LADWP_Data(:,7))+5)]);
set(gca,'xtick',[-20:10:120],'xticklabel',{'-20','-10','0','10','20','30','40','50','60','70','80','90','100','110','120'}); 
xlabel(['Zone Mean Representative City Temperature [',setstr(176),'C]'],'FontSize',18);
ylim([(min(LADWP_Data(:,8))-50) (max(LADWP_Data(:,8))+50)]);
ylabel('Net BEND Load [MW]','FontSize',18);
set(gca,'LineWidth',1.5,'FontSize',15,'Box','on','Layer','top')
text(0.00,1.12,'(b)','FontSize',21,'Units','normalized');
title('LADWP','FontSize',24)
    
subplot(2,2,3); hold on
scatter(WY_Data(:,7),WY_Data(:,8),25,'k')
line(WY_Fit(1,:),WY_Fit(2,:),'Color','c','LineWidth',3)
scatter(WY_Statistics(1,1),WY_Statistics(1,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(WY_Statistics(2,1),WY_Statistics(2,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
scatter(WY_Statistics(3,1),WY_Statistics(3,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(WY_Statistics(4,1),WY_Statistics(4,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
xlim([(min(WY_Data(:,7))-5) (max(WY_Data(:,7))+5)]);
set(gca,'xtick',[-20:10:120],'xticklabel',{'-20','-10','0','10','20','30','40','50','60','70','80','90','100','110','120'}); 
xlabel(['Zone Mean Representative City Temperature [',setstr(176),'C]'],'FontSize',18);
ylim([(min(WY_Data(:,8))-50) (max(WY_Data(:,8))+50)]);
ylabel('Net BEND Load [MW]','FontSize',18);
set(gca,'LineWidth',1.5,'FontSize',15,'Box','on','Layer','top')
text(0.00,1.12,'(c)','FontSize',21,'Units','normalized');
title('WY','FontSize',24)

subplot(2,2,4); hold on
scatter(SNev_Data(:,7),SNev_Data(:,8),25,'k')
line(SNev_Fit(1,:),SNev_Fit(2,:),'Color','c','LineWidth',3)
scatter(SNev_Statistics(1,1),SNev_Statistics(1,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(SNev_Statistics(2,1),SNev_Statistics(2,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
scatter(SNev_Statistics(3,1),SNev_Statistics(3,2),200,'s','filled','MarkerFaceColor','m','MarkerEdgeColor','k','LineWidth',3)
scatter(SNev_Statistics(4,1),SNev_Statistics(4,2),200,'d','filled','MarkerFaceColor','r','MarkerEdgeColor','k','LineWidth',3)
xlim([(min(SNev_Data(:,7))-5) (max(SNev_Data(:,7))+5)]);
set(gca,'xtick',[-20:10:120],'xticklabel',{'-20','-10','0','10','20','30','40','50','60','70','80','90','100','110','120'}); 
xlabel(['Zone Mean Representative City Temperature [',setstr(176),'C]'],'FontSize',18);
ylim([(min(SNev_Data(:,8))-50) (max(SNev_Data(:,8))+50)]);
ylabel('Net BEND Load [MW]','FontSize',18);
set(gca,'LineWidth',1.5,'FontSize',15,'Box','on','Layer','top')
text(0.00,1.12,'(d)','FontSize',21,'Units','normalized');
title('SNev','FontSize',24)

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_4.png']);
   close(a);
end
clear a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir save_images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%