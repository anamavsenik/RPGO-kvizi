% TEST

% Kontrolne toèke Bezierjeve krivulje po vrsticah
B = [0 0; 2 6; 3 0; 5 4; 7 1; 5 5; 10 6];

% Višanje stopnje Bezierjeve krivulje za 3, 10 in 30
% Dobimo kontrolne toèke pripadajoèe krivulje z višjo stopnjo
B3 = bezierelv(B,3);
B10 = bezierelv(B,10);
B30 = bezierelv(B, 30);

% Interval za risanje
t = linspace(0, 1, 30);

clf
hold on

% Izris
b = bezier(B, t);
% Kontrolni poligon
plot(B(:, 1), B(:, 2), 'k')
% Toèke kontrolnega poligona
plot(B(:, 1), B(:, 2), 'b.', 'MarkerSize', 20)
% Krivulja
plot(b(:, 1), b(:, 2), 'b')

 %Prva (višanje za 3 stopnje)
b3 = bezier(B3, t);
plot(B3(:,1),B3(:,2), 'k')
plot(B3(:,1),B3(:,2), 'r.', 'MarkerSize', 20)
plot(b3(:,1),b3(:,2), 'c*')
% 
% Druga
% b10 = bezier(B10, t);
% plot(B10(:,1),B10(:,2), 'k')
% plot(B10(:,1),B10(:,2), 'r.', 'MarkerSize', 20)
% plot(b10(:,1),b10(:,2), 'c*')
% 
% 
% % Tretja
% b30 = bezier(B30, t);
% plot(B30(:,1),B30(:,2), 'k')
% plot(B30(:,1),B30(:,2), 'r.', 'MarkerSize', 20)
% plot(b30(:,1),b30(:,2), 'c*')


hold off