%% This file is used to generate the video for the state transition process 
v = VideoWriter('myVideo.avi');
open(v);

for i = 1:1:35
        for lab = [labs(1),labs(i)]
            idp = ceil((lab-1)/120+1);
            sol = bvp_read_solution('', runName, lab); % Extract solution
            plotringTwi([sol.x(:,7);sol.x(:,20);sol.x(:,33);sol.x(:,46)],...
                [sol.x(:,8);sol.x(:,21);sol.x(:,34);sol.x(:,47)],...
                [sol.x(:,9);sol.x(:,22);sol.x(:,35);sol.x(:,48)],idp);
        end
       
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])

set(gca,'Visible','off');
frame = getframe(gcf) ;
writeVideo(v,frame);
set(gca, 'XAxisLocation', 'top');
end
close(v);
