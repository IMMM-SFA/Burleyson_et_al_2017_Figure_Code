% Figure_6.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 6 from Burleyson et al. 2017

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
load([data_input_dir,'Figure_6_Data.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); hold on;
scatter(-1,-1,200,'b','filled'); scatter(-1,-1,200,'g','filled'); scatter(-1,-1,200,'r','filled'); scatter(-1,-1,200,[1 0.5 0],'filled');
for row = 1:8
    for column = 2:5
        if column == 2; offset_min = -0.2; offset_max = -0.10; color_bar = 'b'; end
        if column == 3; offset_min = -0.1; offset_max = -0.00; color_bar = 'g'; end
        if column == 4; offset_min = 0.00; offset_max = 0.10;  color_bar = 'r'; end
        if column == 5; offset_min = 0.10; offset_max = 0.20;  color_bar = [1 0.5 0]; end
        scatter(row+((offset_min + offset_max)/2),Seasonal_Mean(row,column),60,color_bar,'filled');
        line([(row+offset_min) (row+offset_max)],[(Seasonal_Mean(row,column)+Seasonal_STD(row,column)) (Seasonal_Mean(row,column)+Seasonal_STD(row,column))],'LineWidth',2,'Color',color_bar)
        line([(row+offset_min) (row+offset_max)],[(Seasonal_Mean(row,column)-Seasonal_STD(row,column)) (Seasonal_Mean(row,column)-Seasonal_STD(row,column))],'LineWidth',2,'Color',color_bar)
        line([(row+offset_min) (row+offset_min)],[(Seasonal_Mean(row,column)-Seasonal_STD(row,column)) (Seasonal_Mean(row,column)+Seasonal_STD(row,column))],'LineWidth',2,'Color',color_bar)
        line([(row+offset_max) (row+offset_max)],[(Seasonal_Mean(row,column)-Seasonal_STD(row,column)) (Seasonal_Mean(row,column)+Seasonal_STD(row,column))],'LineWidth',2,'Color',color_bar)
        clear offset_min offset_max color_bar
    end
    clear column
end
legend('Dec-Jan-Feb','Mar-Apr-May','Jun-Jul-Aug','Sep-Oct-Nov','Location','North','Orientation','Horizontal')
xlim([0.65 8.35 ]); ylim([-12 37])
h1 = gca;
set(h1,'xtick',[1 2 3 4 5 6 7 8],'xticklabel',{'2B','3B','3C','4B','4C','5B','6B','7B'})
set(h1,'ytick',[-100:10:100],'yticklabel',{'-100','-90','-80','-70','-60','-50','-40','-30','-20','-10','0','10','20','30','40','50','60','70','80','90','100'})
ylabel(['Seasonal Mean Temperature [',setstr(176),'C]'],'FontSize',21)
xlabel('IECC Climate Zone','FontSize',21)
h2 = axes('Position',get (h1, 'Position')); set(h2,'YAxisLocation','right','XAxisLocation','top','Color', 'None')
set(h2,'XLim',get(h1,'XLim'),'Layer','top'); set(h2,'YLim',get(h1,'YLim'),'Layer','top'); set(h2,'ytick',[]);
set(h2,'xtick',[1 2 3 4 5 6 7 8],'xticklabel',{'Phoenix','Las Vegas','S. Francisco','Albuquerque','Seattle','Denver','Helena','Aspen'})
set(h1,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top'); set(h2,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top')
if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_6.png']);
   close(a);
end
clear a h1 h2 row
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