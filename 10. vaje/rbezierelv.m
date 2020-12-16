function [Be,we] = rbezierelv(B,w)
% Opis:
%   rbezierelv  izvede  vi�anje  stopnje  dane  racionalne
%   Bezierjeve  krivulje
%
% Definicija:
%   [Be ,we] = rbezierelv(B,w)
%
% Vhodna  podatka:
%   B matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  to�ko
% racionalne  Bezierjeve  krivulje  stopnje n,
%   w seznam  ute�i  racionalne  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   Be    matrika  velikosti n+2 x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  to�ko
% racionalne  Bezierjeve  krvulje  stopnje n+1, ki je
% prirejena  dani  racionalni  Bezierjevi  krivulji ,
%   we    seznam  dol�ine n+2, v katerem  vsak  element
% predstavlja  ute�  racionalne  Bezierjeve  krvulje
% stopnje n+1, ki je  prirejena  dani  racionalni
% Bezierjevi  krivulji

[n,d] = size(B); %velikost in dimenzija
BPOS = zeros(n,d+1); %nove polinomske kontrolne to�ke n*(d+1) oblike (w_i*b_i,w_i)
for i = 1:n
    for j = 1:d
        BPOS(i,j) = w(i)*B(i,j); % lahko tudi brez zanke j pa gre� BPOS(i, 1:d)=w(i)*B(i,:);
    end
    BPOS(i,d+1) = w(i);
end
BB = bezierelv1(BPOS);%povi�amo stopnjo kontrolnih to�k za ena
Be = zeros(n+1,d);%izra�un kontrolnih to�k
we = BB(:,d+1);
for i = 1:n+1
    for j = 1:d
        Be(i,j) =  BB(i,j)/we(i);
    end
end

end