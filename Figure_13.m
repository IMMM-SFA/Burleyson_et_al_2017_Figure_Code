% Figure_13.m
% 20170823
% Casey D. Burleyson
% Pacific Northwest National Laboratory
% Plot Figure 13 from Burleyson et al. 2017

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
load([data_input_dir,'Figure_13_Data.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PROCESSING SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              BEGIN PLOTTING SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = figure('Color',[1 1 1]); set(a,'Position',get(0,'Screensize')); b = colormap(jet(19)); 
subplot(2,5,[1 2]); hold on; set(gca,'clim',[1,20]);
hobj = patch([-5 -5 5 5],[0.9 1.1 1.1 0.9],[(199/255) (199/255) (199/255)]); hAnnotation = get(hobj,'Annotation'); hLegendEntry = get(hAnnotation,'LegendInformation'); set(hLegendEntry,'IconDisplayStyle','off');
scatter(NaN.*1,NaN.*1,150,'k','filled'); scatter(NaN.*1,NaN.*1,150,'k'); line([0 0],[0 1000],'Color','k','LineWidth',3,'LineStyle','-');
for i = 1:19
    scatter(DJF_T(1,i),DJF_Load(1,i),100,b(PZ(i,2),1:3),'filled')
    scatter(DJF_T(6,i),DJF_Load(6,i),100,b(PZ(i,2),1:3),'LineWidth',2)
    line([DJF_T(1,i) DJF_T(6,i)],[DJF_Load(1,i) DJF_Load(6,i)],'LineWidth',1.5,'Color',b(PZ(i,2),1:3))
end
line([0 0],[0 1000],'Color','k','LineWidth',3,'LineStyle','-'); 
line([-100 100],[1 1],'Color','k','LineWidth',3,'LineStyle','-'); 
legend('Class A','Class F','1:1 Match','Location','NorthEast')
xlim([min(min(DJF_T([1 6],:),[],2))-1.5 max(max(DJF_T([1 6],:),[],2))+1.5]);
set(gca,'xtick',[-15:2.5:15],'xticklabel',{'-15','-12.5','-10','-7.5','-5','-2.5','0','2.5','5','7.5','10','12.5','15'});
xlabel('','FontSize',21);
ylim([min(min(DJF_Load([1 6],:),[],2))-0.05 max(max(DJF_Load([1 6],:),[],2))+0.05]);
set(gca,'ytick',[0:0.1:2],'yticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0'});
ylabel('97.5 %tile Load Ratio','FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top');
text(0.02,0.925,'(a)','FontSize',21,'Units','normalized');
title('Dec-Jan-Feb: 2.5 %tile of T','FontSize',24)

subplot(2,5,[3 4]); hold on; set(gca,'clim',[1,20]);
hobj = patch([-5 -5 5 5],[0.9 1.1 1.1 0.9],[(199/255) (199/255) (199/255)]); hAnnotation = get(hobj,'Annotation'); hLegendEntry = get(hAnnotation,'LegendInformation'); set(hLegendEntry,'IconDisplayStyle','off');
for i = 1:19
    scatter(MAM_T(1,i),MAM_Load(1,i),100,b(PZ(i,2),1:3),'filled')
    scatter(MAM_T(6,i),MAM_Load(6,i),100,b(PZ(i,2),1:3),'LineWidth',2)
    line([MAM_T(1,i) MAM_T(6,i)],[MAM_Load(1,i) MAM_Load(6,i)],'LineWidth',1.5,'Color',b(PZ(i,2),1:3))
end
line([0 0],[0 1000],'Color','k','LineWidth',3,'LineStyle','-'); 
line([-100 100],[1 1],'Color','k','LineWidth',3,'LineStyle','-');
xlim([min(min(MAM_T([1 6],:),[],2))-1.5 max(max(MAM_T([1 6],:),[],2))+1.5]);
set(gca,'xtick',[-15:2.5:15],'xticklabel',{'-15','-12.5','-10','-7.5','-5','-2.5','0','2.5','5','7.5','10','12.5','15'});
xlabel('','FontSize',21);
ylim([min(min(MAM_Load([1 6],:),[],2))-0.05 max(max(MAM_Load([1 6],:),[],2))+0.05]);
set(gca,'ytick',[0:0.1:2],'yticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0'});
ylabel('','FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top');
text(0.02,0.925,'(b)','FontSize',21,'Units','normalized');
title('Mar-Apr-May: 97.5 %tile of T','FontSize',24)

subplot(2,5,[6 7]); hold on; set(gca,'clim',[1,20]);
hobj = patch([-5 -5 5 5],[0.9 1.1 1.1 0.9],[(199/255) (199/255) (199/255)]); hAnnotation = get(hobj,'Annotation'); hLegendEntry = get(hAnnotation,'LegendInformation'); set(hLegendEntry,'IconDisplayStyle','off');
for i = 1:19
    scatter(JJA_T(1,i),JJA_Load(1,i),100,b(PZ(i,2),1:3),'filled')
    scatter(JJA_T(6,i),JJA_Load(6,i),100,b(PZ(i,2),1:3),'LineWidth',2)
    line([JJA_T(1,i) JJA_T(6,i)],[JJA_Load(1,i) JJA_Load(6,i)],'LineWidth',1.5,'Color',b(PZ(i,2),1:3))
end
line([0 0],[0 1000],'Color','k','LineWidth',3,'LineStyle','-'); 
line([-100 100],[1 1],'Color','k','LineWidth',3,'LineStyle','-');
xlim([min(min(JJA_T([1 6],:),[],2))-1.5 max(max(JJA_T([1 6],:),[],2))+1.5]);
set(gca,'xtick',[-15:2.5:15],'xticklabel',{'-15','-12.5','-10','-7.5','-5','-2.5','0','2.5','5','7.5','10','12.5','15'});
xlabel(['Representative City T - NLDAS T [',setstr(176),'C]'],'FontSize',21);
ylim([min(min(JJA_Load([1 6],:),[],2))-0.05 max(max(JJA_Load([1 6],:),[],2))+0.05]);
set(gca,'ytick',[0:0.1:2],'yticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0'});
ylabel('97.5 %tile Load Ratio','FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top');
text(0.02,0.925,'(c)','FontSize',21,'Units','normalized');
title('Jun-Jul-Aug: 97.5 %tile of T','FontSize',24)

subplot(2,5,[8 9]); hold on; set(gca,'clim',[1,20]);
hobj = patch([-5 -5 5 5],[0.9 1.1 1.1 0.9],[(199/255) (199/255) (199/255)]); hAnnotation = get(hobj,'Annotation'); hLegendEntry = get(hAnnotation,'LegendInformation'); set(hLegendEntry,'IconDisplayStyle','off');
for i = 1:19
    scatter(SON_T(1,i),SON_Load(1,i),100,b(PZ(i,2),1:3),'filled')
    scatter(SON_T(6,i),SON_Load(6,i),100,b(PZ(i,2),1:3),'LineWidth',2)
    line([SON_T(1,i) SON_T(6,i)],[SON_Load(1,i) SON_Load(6,i)],'LineWidth',1.5,'Color',b(PZ(i,2),1:3))
end
line([0 0],[0 1000],'Color','k','LineWidth',3,'LineStyle','-'); 
line([-100 100],[1 1],'Color','k','LineWidth',3,'LineStyle','-');
xlim([min(min(SON_T([1 6],:),[],2))-1.5 max(max(SON_T([1 6],:),[],2))+1.5]);
set(gca,'xtick',[-15:2.5:15],'xticklabel',{'-15','-12.5','-10','-7.5','-5','-2.5','0','2.5','5','7.5','10','12.5','15'});
xlabel(['Representative City T - NLDAS T [',setstr(176),'C]'],'FontSize',21);
ylim([min(min(SON_Load([1 6],:),[],2))-0.05 max(max(SON_Load([1 6],:),[],2))+0.05]);
set(gca,'ytick',[0:0.1:2],'yticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0'});
ylabel('','FontSize',21);
set(gca,'LineWidth',1.5,'FontSize',18,'Box','on','Layer','top');
text(0.02,0.925,'(d)','FontSize',21,'Units','normalized');
title('Sep-Oct-Nov: 2.5 %tile of T','FontSize',24)

subplot(2,5,[5 10])
set(gca,'xcolor','w'); set(gca,'ycolor','w'); set(gca,'ytick',[]); set(gca,'xtick',[]);
set(gca,'clim',[1,20]);
colo = colorbar('ytick',[1.5:1:19.5],'YTickLabel',{'AZ-PV','CA-Bay','CA-N','CA-SCE','CA-SDGE','CA-ZP26','CenVal','CO-East','CO-West','Idaho','IID','LADWP','Montana','NM','NNev','NW-Mid-C','SNev','Utah','WY'},'Location','West');
set(gca,'LineWidth',1.5,'FontSize',18,'Box','off','Layer','top')

if save_images == 1
   set(gcf,'Renderer','zbuffer'); set(gcf,'PaperPositionMode','auto');
   print(a,'-dpng','-r600',[image_output_dir,'Figure_13.png']);
   close(a);
end
clear a b i colo ans hAnnotation hLegendEntry hobj
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               END PLOTTING SECTION                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                BEGIN CLEANUP SECTION                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear data_input_dir image_output_dir save_images PZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 END CLEANUP SECTION                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%