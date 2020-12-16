clf;
hold on

t = 0:0.0001:1; % s takim razmahom dela točke
l = length(t); %1001 točka

phi = pi/6; %naš fi

zac = [cos(phi) -sin(phi)]; %to je naš b_0, robna točka
kon = [cos(phi) sin(phi)]; %to je naša končna točka

% metoda 1 na vajah 1. točka

b1 = [1/cos(phi) 0]; % napišemo točko b_1
B = [zac; b1; kon]; %zložimo vse v B

%vrne točko na Bezierovih krivulja pri danih parametrih
bezier(B, linspace(0, 1, 10));

%narišemo krivuljo
plotbezier(B, t, 'r-', false); %rdeče barve, nariše pa tudi kontrolni poligon
for i=2:2:12 %nariše 6 delov krivulje saj rišemo za kot pi/6
   tr = [cos(i*phi) sin(i*phi); -sin(i*phi) cos(i*phi)];
   plotbezier(B, t, 'r-', false, tr); %riše vse vmesne krivulje
end


% metoda 2

b1 = [cos(phi)+1/3*sin(phi) -sin(phi)+1/3*cos(phi)];
b2 = [cos(phi)+1/3*sin(phi) sin(phi)-1/3*cos(phi)];
B = [zac; b1; b2; kon];

plotbezier(B, t, 'g-', false);
for i=2:2:12
    tr = [cos(i*phi) sin(i*phi); -sin(i*phi) cos(i*phi)];
    plotbezier(B, t, 'g-', false, tr);
end

% metoda 3

b1 = [4- cos(phi) 4*cot(phi)-4/sin(phi)+sin(phi)]/3;
b2 = [4- cos(phi) -4*cot(phi)+4/sin(phi)-sin(phi)]/3;
B = [zac; b1; b2; kon];

plotbezier(B, t, 'b-', false);
for i=2:2:12
    tr = [cos(i*phi) sin(i*phi); -sin(i*phi) cos(i*phi)];
    plotbezier(B, t, 'b-', false, tr);
end

axis equal;
hold off;