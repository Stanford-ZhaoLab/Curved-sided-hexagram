%% Jacobian of boundary conditions
function Jbc = tri_bc_DFDX(T, x0, x1, p)

Jbc = zeros(53,106);

Jbc(1,1) = 1;
Jbc(2,3) = 1;
Jbc(3,7) = 1;
Jbc(4,8) = 1;
Jbc(5,10) = 1;
Jbc(6,12) = 1;
Jbc(7,13) = 1;
Jbc(8:46,15:53) = eye(39);
Jbc(8:46,54:92) = -eye(39);
Jbc(47,93) = 1;
Jbc(48,94) = 1;
Jbc(49,100) = 1;
Jbc(50,102) = 1;
Jbc(51,103) = 1;
Jbc(52,104) = 1;
Jbc(53,105) = 1;
Jbc(50,106) = -1/sqrt(2)*(-1/2*sin(p/2));
Jbc(51,106) = -1/sqrt(2)*(-1/2*sin(p/2));
Jbc(52,106) = -1/sqrt(2)*(1/2*cos(p/2));
Jbc(53,106) = 1/sqrt(2)*(1/2*cos(p/2));

end
