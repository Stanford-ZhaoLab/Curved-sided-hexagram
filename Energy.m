%% This file is used to plot the energy landscape during the state transition
U = zeros(size(labs));
for lab = labs
        sol = bvp_read_solution('', runName, lab); % Extract solution
        k11 = sol.x(:,4);
        k21 = sol.x(:,5);
        k31 = sol.x(:,6);
        k12 = sol.x(:,17);
        k22 = sol.x(:,18);
        k32 = sol.x(:,19);
        k13 = sol.x(:,30);
        k23 = sol.x(:,31);
        k33 = sol.x(:,32);
        k14 = sol.x(:,43);
        k24 = sol.x(:,44);
        k34 = sol.x(:,45);

       ds1 = l1/2/size(k11,1);
       ds2 = l2/size(k12,1);
       ds3 = l1/size(k13,1);
       ds4 = l2/2/size(k14,1);

U(lab) = 2*sum(a*4*pi^2*(k11-k1).^2.*ds1+b*4*pi^2*(k21-0).^2.*ds1+4*pi^2*(k31-0).^2.*ds1+4*pi*M1*(k11-k1).*ds1)...
       + 2*sum(a*4*pi^2*(k12-k2).^2.*ds2+b*4*pi^2*(k22-0).^2.*ds2+4*pi^2*(k32-0).^2.*ds2+4*pi*M1*(k12-k2).*ds2)...
       + 2*sum(a*4*pi^2*(k13-k1).^2.*ds3+b*4*pi^2*(k23-0).^2.*ds3+4*pi^2*(k33-0).^2.*ds3+4*pi*M1*(k13-k1).*ds3)...
       + 2*sum(a*4*pi^2*(k14-k2).^2.*ds4+b*4*pi^2*(k24-0).^2.*ds4+4*pi^2*(k34-0).^2.*ds4+4*pi*M1*(k14-k2).*ds4)...
       + M1^2*(3*l1+3*l2)/a;
end
figure(3); % energy landscape
plot(Yer,U','Linewidth',1.5)
xlabel('Bending angle (rad)'); ylabel('UL/GJ');
xticks([0:1/4:1]*pi);
xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi'});
set(gca,'FontName','Times New Roman','FontSize',15);
hold off;