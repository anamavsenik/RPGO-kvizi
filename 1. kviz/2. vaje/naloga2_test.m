% TEST

% % a)

% Kontrolne toèke krivulje po vrsticah
B = [0 0; 1 2; 3 3; 4 -1; 0 2];
t0 = 0.5;

% decasteljau na prvi komponenti pri t = t0
D = decasteljau(B(:,1), t0);

% % b)

% Izraèun toèk na bezierovi kriulji pri izbranih parametrih
t1 = linspace(0, 1);
b = bezier(B, t1);

% % c)
% izris
figure
iden = eye(2);
plotbezier(B, t1, iden)

% zrcaljenje
figure
zrc = [-1, 0; 0, 1];
plotbezier(B, t1, zrc)

% rotacija za kot fi
figure
fi = pi/3;
rot = [cos(fi) sin(fi); -sin(fi) cos(fi)];
plotbezier(B, t1, rot)