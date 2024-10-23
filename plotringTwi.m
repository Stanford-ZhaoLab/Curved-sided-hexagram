%% Coordinate of the ring
function plotringTwi(r1,r2,r3,idx)

if idx ==1
    plot3(r2(end),r3(end),r1(end),'ok','MarkerSize',6); hold on;
    plot3(r2(end),-r3(end),r1(end),'ok','MarkerSize',6); hold on;
    plot3(r2,r3,r1,'-.','Color',[0.5,0.5,0.5],'Linewidth',1.5);
    plot3(r2,-r3,r1,'-.','Color',[0.5,0.5,0.5],'Linewidth',1.5);
    plot3(2*r2(end)-r2,r3,r1,'-.','Color',[0.5,0.5,0.5],'Linewidth',1.5);
    plot3(2*r2(end)-r2,-r3,r1,'-.','Color',[0.5,0.5,0.5],'Linewidth',1.5);
else
    plot3(r2(end),r3(end),r1(end),'ok','MarkerSize',6);hold on;
    plot3(r2(end),-r3(end),r1(end),'ok','MarkerSize',6);hold on;
    plot3(r2(end),r3(end),r1(end)); hold on;
    plot3(r2(end),-r3(end),r1(end)); hold on;
    plot3(r2,r3,r1,'Color','[0,0,0]','Linewidth',2); hold on;
    plot3(r2,-r3,r1,'Color','[0,0,0]','Linewidth',2);
    plot3(2*r2(end)-r2,r3,r1,'Color','[0,0,0]','Linewidth',2);
    plot3(2*r2(end)-r2,-r3,r1,'Color','[0,0,0]','Linewidth',2);
end

xlabel('2');ylabel('3');zlabel('1');
axis equal
axis([-1 1 -1 1])
grid on;
hold off
end