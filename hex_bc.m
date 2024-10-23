%% Boundary conditions
function fbc = hex_bc(T, x0, x1, p)
global k1 k2

% T is independent variable, normalized to (0,1).
% x0 is left boundary, x1 is right boundary.
% p is continuation parameter (bending angle here).

fbc = [T-1;
      x0(2)-0;
      x0(6)-0;
      x0(7)-0;
      x0(9)-0;
      x0(11)-0;
      x0(12)-0;
      x0(14)-x1(1);
      x0(15)-x1(2);
      x0(16)-x1(3);
      x0(17)-x1(4)+k1-k2;%2left
      x0(18)-x1(5);
      x0(19)-x1(6);
      x0(20)-x1(7);
      x0(21)-x1(8);
      x0(22)-x1(9);
      x0(23)-x1(10);
      x0(24)-x1(11);
      x0(25)-x1(12);
      x0(26)-x1(13);
      x0(27)-x1(14);
      x0(28)-x1(15);
      x0(29)-x1(16);
      x0(30)-x1(17)-k1+k2;
      x0(31)-x1(18);
      x0(32)-x1(19);
      x0(33)-x1(20);
      x0(34)-x1(21);
      x0(35)-x1(22);
      x0(36)-x1(23);
      x0(37)-x1(24);
      x0(38)-x1(25);
      x0(39)-x1(26);
      x0(40)-x1(27);
      x0(41)-x1(28);
      x0(42)-x1(29);
      x0(43)-x1(30)+k1-k2;
      x0(44)-x1(31);
      x0(45)-x1(32);
      x0(46)-x1(33);
      x0(47)-x1(34);
      x0(48)-x1(35);
      x0(49)-x1(36);
      x0(50)-x1(37);
      x0(51)-x1(38);
      x0(52)-x1(39);
      x1(40)-0;
      x1(41)-0;
      x1(47)-0;
      x1(49)-1/sqrt(2)*cos(p/2);
      x1(50)-1/sqrt(2)*cos(p/2);
      x1(51)-1/sqrt(2)*sin(p/2);
      x1(52)+1/sqrt(2)*sin(p/2)];
end
