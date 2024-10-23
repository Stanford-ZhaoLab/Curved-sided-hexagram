%% Main code for calculating moment curve and folded configuration of star and daisy hexagrams under bending at corners
% Note that for the star hexagram, the curvature k1 and kn take negative values, and k2 takes positive values 
% For the daisy hexagram, the curvature k1 and kn take positive values, and k2 takes negative values

global a b k1 k2 l1 l2 M1
runName = 'recttest';

% Geometric dimensions
r = 1;
L = 200;
t = 0.5;
h = 2;

l1 = 200/L;           % dimensinless arc length of the curved edge
k1 = -1/3;            % dimensinless curvature of the curved edge
l2 = pi/L;            % dimensinless arc length of the rounded corner
k2 = 1*L/(2*pi);      % dimensinless curvature of the rounded corner
h2t = h/t;            % height-to-thickness ratio

kn = -0.2;           % dimensinless natural curvature

pr = 1/3;             % Poisson's ratio
% a = EI1/GJ and b=EI2/GJ are the two dimensionless bending rigidities.
lambda = 1-(192/pi^5)./h2t.*(tanh(pi*h2t/2)+1/3^5*tanh(3*pi*h2t/2)+1/5^5*tanh(5*pi*h2t/2));
a = (1+pr)/(2*lambda); 
b = a*h2t^2;

M1 = 2*pi*a*(k1-kn);

% Boundary values of an initial solution (starting point of continuation)
% The initial solution for (F1, F2, F3, k1, k2, k3, r1, r2, r3, q0, q1, q2,
% q3) in each segment can be taken as the parameters of the initial unfolded
% state. The following initial solution can be applied to both star and
% daisy hexagrams.
t0 = [0, 1];
x0 = [0,0,0, k1,0,0, 0,3/(2*pi),0, 1,0,0,0, ... 1 left
    0,0,0, k2,0,0, 0,9/(4*pi)+0.1,3*sqrt(3)/(4*pi)-0.1, cos(pi/12),sin(pi/12),0,0, ... 2 left
    0,0,0, k1,0,0, 0,9/(4*pi)-0.1,3*sqrt(3)/(4*pi)+0.1, cos(pi/12),sin(pi/12),0,0,... 3 left
    0,0,0, k2,0,0, 0,r/L,3/pi-0.1, sqrt(2)/2,sqrt(2)/2,0,0; ... 4 left
    0,0,0, k1,0,0, 0,9/(4*pi)+0.1,3*sqrt(3)/(4*pi)-0.1, cos(pi/12),sin(pi/12),0,0, ... 1 right
    0,0,0, k2,0,0, 0,9/(4*pi)-0.1,3*sqrt(3)/(4*pi)+0.1, cos(pi/12),sin(pi/12),0,0, ... 2 right
    0,0,0, k1,0,0, 0,r/L,3/pi-0.1, sqrt(2)/2,sqrt(2)/2,0,0,... 3 right
    0,0,0, k2,0,0, 0,0,3/pi, sqrt(2)/2,sqrt(2)/2,0,0];
% F1, F2, F3, k1, k2, k3, r1, r2, r3, q0, q1, q2, q3

% Continuation parameter
Y0 = 0; % Angle, as additional parameter p

%% Coco implementation 1
% An implementation of BVPs (other implementations are possible).

coco_use_recipes_toolbox coll_v1 bvp_v1 msbvp_v1 % add the coll_v1 and msbvp_v1 toolboxes to the search path

% Construction of coco problem
coll_args = {@hex, t0, x0, 'Y', Y0};
bvp_args  = [coll_args, {@hex_bc, @hex_bc_DFDX}];
prob      = bvp_isol2seg(coco_prob(), '', bvp_args{:});

% coco parameter setting
prob = coco_set(prob, 'cont', 'NAdapt', 10, 'ItMX', 100000, 'NPR',2);
prob = coco_set(prob, 'cont', 'LogLevel',[1 0]);

% Run coco
bd1 = coco(prob, runName, [], 1, 'Y', [0 pi]);

%% Read resutls and plot
bd1 = coco_bd_read(runName); % bifurcation data
labs = coco_bd_labs(bd1); % solution labels

figure(1); % plot the folded configuration
for lab = [labs(1),labs(end)]
    idp = ceil((lab-1)/3000+1);
    sol = bvp_read_solution('', runName, lab); % Extract solution
    plotringTwi([sol.x(:,7);sol.x(:,20);sol.x(:,33);sol.x(:,46)],...
            [sol.x(:,8);sol.x(:,21);sol.x(:,34);sol.x(:,47)],...
            [sol.x(:,9);sol.x(:,22);sol.x(:,35);sol.x(:,48)],idp);
    hold on;
end

Yer = []; M2bar = [];
for lab = labs
    sol = bvp_read_solution('', runName, lab); % Extract solution
    Yer = [Yer,sol.p]; M2bar = [M2bar,-2*sol.x(end,45)];
end
    
figure(2); % plot the ML/GJ vs. bending angle curve
plot(Yer,2*pi*M2bar,'Linewidth',1.5); hold on; % ML/GJ

% plot settings
plot([0,pi],[0,0],'--k','linewidth',1)
xlabel('Bending angle (rad)'); ylabel('ML/GJ');
xticks([0:1/4:1]*pi);
xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi'});
set(gca,'FontName','Times New Roman','FontSize',15);
hold off;