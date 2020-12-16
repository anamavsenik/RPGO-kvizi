function [D] = decasteljau(b,t)
% Opis:
%  decasteljau vrne shemo de Casteljaujevega postopka za dan
%  seznam koordinat b pri danem parametru t
%
% Definicija:
%  D = decasteljau(b,t)
%
% Vhodna podatka:
%  b    seznam koordinat kontrolnih tock Bezierjeve krivulje
%       stopnje n,
%  t    parameter, pri katerem racunamo koordinato
%       Bezierjeve krivulje
%
% Izhodni podatek:
%  D    tabela velikosti n+1 x n+1, ki predstavlja de
%       Casteljaujevo shemo za koordinate b pri parametru t
%       (element na mestu (1,n+1) je koordinata Bezierjeve
%       krivulje pri parametru t, elementi na mestih (i,j)
%       za i > n-j+2 so NaN)

m = length(b); % = n+1
n = m-1;
D = zeros(m,m); % matrika za x-koordinate postopka

for i = 1:m
    D(i,1) = b(i,1); % v 1.stolpcu D so x-koordinate od kontrolnih toèk
end

for j = 2:m % od 2.stolpca naprej
    for i = 1:(m-j+1) % gre po vrsticah (zgor.trik.)
        D(i,j) = (1-t) * D(i,j-1) + t * D(i+1,j-1);
    end
    for i = (m-j+2):m
        D(i,j) = NaN;
    end
end

D;
end
