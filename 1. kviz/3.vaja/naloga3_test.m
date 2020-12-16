% TEST

% Matrika kontrolnih toèk
B = [-2/3 -4/5; 1/3, 1/5; 0 0; -1/3 1/5; 2/3 -4/5];

% Delitev intervala
t = linspace(0, 1);

[n, ~] = size(B);

% plotbezier(B, t);
% pause;
hold on
figure
iden = eye(2);
plotbezier(B, t, iden)
for i=1:2
    % Izraèun kontrolnih toèk odvoda
    b = bezierder(B, i, t);
    plot(b(:,1), b(:,2), 'r'); %to zgolj izraèuna vrednost odvoda pri parametru t
end
hold off