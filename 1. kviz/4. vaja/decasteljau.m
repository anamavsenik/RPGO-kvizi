function D = decasteljau(b, t)
% Opis :
% decasteljau vrne shemo de Casteljaujevega postopka za dan
% seznam koordinat b pri danem parametru t
%
% Definicija :
% D = decasteljau (b,t)
%
% Vhodna podatka :
% b seznam koordinat kontrolnih to?k Bezierjeve krivulje
% stopnje n,
% t parameter , pri katerem ra?unamo koordinato
% Bezierjeve krivulje
%
% Izhodni podatek :
% D tabela velikosti n+1 x n+1 , ki predstavlja de
% Casteljaujevo shemo za koordinate b pri parametru t
% ( element na mestu (1 ,n +1) je koordinata Bezierjeve
% krivulje pri parametru t, elementi na mestih (i,j)
% za i > n-j+2 so NaN )

n = length(b);
D = NaN(n);

for i = 1:n
    D(:, 1) = b;
end

% i ima vlogo r-ja iz sheme shemi
for i =2:n
    % j ima vlogo i-ja iz sheme shemi
    for j = 1:n-i+1
        D(j, i) = D(j, i-1)*(1-t) + D(j+1, i-1)*t;
    end
end
end