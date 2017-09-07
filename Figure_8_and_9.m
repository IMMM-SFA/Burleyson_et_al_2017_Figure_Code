% Figure_8_and_9.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figures 8 and 9 from Burleyson et al. 2017

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
%            BEGIN PRE-PROCESSING SECTION             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load the data file for the figure:
load([data_input_dir,'Figure_8_and_9_Data.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on;
scatter(-1,-1,200,'b','filled'); scatter(-1,-1,200,'g','filled'); scatter(-1,-1,200,'r','filled'); scatter(-1,-1,200,[1 0.5 0],'filled');
for class = 1:6
    for season = 1:4
        if season == 1; offset_min = -0.2; offset_max = -0.1; color_bar = 'b'; end
        if season == 2; offset_min = -0.1; offset_max = -0.0; color_bar = 'g'; end
        if season == 3; offset_min = 0.0;  offset_max = 0.1;  color_bar = 'r'; end
        if season == 4; offset_min = 0.1;  offset_max = 0.2;  color_bar = [1 0.5 0]; end
        scatter(class+((offset_min + offset_max)/2),T_Stats(class,2,season),150,color_bar,'filled');
        line([(class+offset_min) (class+offset_max)],[T_Stats(class,3,season) T_Stats(class,3,season)],'LineWidth',2,'Color',color_bar)
        line([(class+offset_max) (class+offset_max)],[T_Stats(class,1,season) T_Stats(class,3,season)],'LineWidth',2,'Color',color_bar)
        line([(class+offset_min) (class+offset_min)],[T_Stats(class,1,season) T_Stats(class,3,season)],'LineWidth',2,'Color',color_bar)
        line([(class+offset_min) (class+offset_max)],[T_Stats(class,1,season) T_Stats(class,1,season)],'LineWidth',2,'Color',color_bar)
        clear offset_min offset_max color_bar
    end
    clear column
end
legend('Dec-Jan-Feb','Mar-Apr-May','Jun-Jul-Aug','Sep-Oct-Nov','Location','North','Orientation','Horizontal')
xlim([0.6 6.4]); ylim([0 6]); h1 = gca;
set(h1,'xtick',[1:1:6],'xticklabel',{'Class A','Class B','Class C','Class D','Class E','Class F'})
set(h1,'ytick',[0:1:10],'yticklabel',{'0','1','2','3','4','5','6','7','8','9','10'})
ylabel(['Root-Mean-Squared WECC Temperature Bias [',setstr(176),'C]'],'FontSize',21)
h2 = axes('Position',get (h1, 'Position')); set(h2,'YAxisLocation','right','XAxisLocation','top','Color', 'None')
set(h2,'XLim',get(h1,'XLim'),'Layer','top'); set(h2,'YLim',get(h1,'YLim'),'Layer','top'); set(h2,'ytick',[]);
set(h2,'xtick',[1:1:6],'xticklabel',{['N = ',num2str(size(find(isnan(T_Bias_RMSE(1,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(2,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(3,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(4,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(5,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(6,:,1))==0),2))]})
set(h1,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top'); set(h2,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_8.png']);
   close(a);
end
clear a class h1 h2 i season


a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on;
scatter(-1,-1,200,'b','filled'); scatter(-1,-1,200,'g','filled'); scatter(-1,-1,200,'r','filled'); scatter(-1,-1,200,[1 0.5 0],'filled');
for class = 1:6
    for season = 1:4
        if season == 1; offset_min = -0.2; offset_max = -0.1; color_bar = 'b'; end
        if season == 2; offset_min = -0.1; offset_max = -0.0; color_bar = 'g'; end
        if season == 3; offset_min = 0.0;  offset_max = 0.1;  color_bar = 'r'; end
        if season == 4; offset_min = 0.1;  offset_max = 0.2;  color_bar = [1 0.5 0]; end
        scatter(class+((offset_min + offset_max)/2),Load_Stats(class,2,season),150,color_bar,'filled');
        line([(class+offset_min) (class+offset_max)],[Load_Stats(class,3,season) Load_Stats(class,3,season)],'LineWidth',2,'Color',color_bar)
        line([(class+offset_max) (class+offset_max)],[Load_Stats(class,1,season) Load_Stats(class,3,season)],'LineWidth',2,'Color',color_bar)
        line([(class+offset_min) (class+offset_min)],[Load_Stats(class,1,season) Load_Stats(class,3,season)],'LineWidth',2,'Color',color_bar)
        line([(class+offset_min) (class+offset_max)],[Load_Stats(class,1,season) Load_Stats(class,1,season)],'LineWidth',2,'Color',color_bar)
        clear offset_min offset_max color_bar
    end
    clear column
end
legend('Dec-Jan-Feb','Mar-Apr-May','Jun-Jul-Aug','Sep-Oct-Nov','Location','North','Orientation','Horizontal')
xlim([0.6 6.4]); ylim([0 20]); h1 = gca;
set(h1,'xtick',[1:1:6],'xticklabel',{'Class A','Class B','Class C','Class D','Class E','Class F'})
set(h1,'ytick',[0:2:20],'yticklabel',{'0','2','4','6','8','10','12','14','16','18','20'})
ylabel(['Root-Mean-Squared Total WECC Load Bias [%]'],'FontSize',21)
h2 = axes('Position',get (h1, 'Position')); set(h2,'YAxisLocation','right','XAxisLocation','top','Color', 'None')
set(h2,'XLim',get(h1,'XLim'),'Layer','top'); set(h2,'YLim',get(h1,'YLim'),'Layer','top'); set(h2,'ytick',[]);
set(h2,'xtick',[1:1:6],'xticklabel',{['N = ',num2str(size(find(isnan(T_Bias_RMSE(1,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(2,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(3,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(4,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(5,:,1))==0),2))],['N = ',num2str(size(find(isnan(T_Bias_RMSE(6,:,1))==0),2))]})
set(h1,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top'); set(h2,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_9.png']);
   close(a);
end
clear a class h1 h2 i season
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir save_images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%