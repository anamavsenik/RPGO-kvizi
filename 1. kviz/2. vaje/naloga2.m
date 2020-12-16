B = [0 0; 1 2; 3 3; 4 -1; 0 2];
t = 0:0.01:1;

% a)krivulja

plotbezier(B, t)
pause;

% b) zrcaljenje ?ez y os

clf
tr = [-1, 0; 0, 1];
plotbezier(B, t, tr)
pause;

% c) rotacija za 60 stopinj

clf
tr = [cos(pi/3) sin(pi/3); -sin(pi/3) cos(pi/3)];
plotbezier(B, t, tr)