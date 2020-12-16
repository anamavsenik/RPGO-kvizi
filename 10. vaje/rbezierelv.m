function [Be,we] = rbezierelv(B,w)
% Opis:
%   rbezierelv  izvede  višanje  stopnje  dane  racionalne
%   Bezierjeve  krivulje
%
% Definicija:
%   [Be ,we] = rbezierelv(B,w)
%
% Vhodna  podatka:
%   B matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  toèko
% racionalne  Bezierjeve  krivulje  stopnje n,
%   w seznam  uteži  racionalne  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   Be    matrika  velikosti n+2 x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  toèko
% racionalne  Bezierjeve  krvulje  stopnje n+1, ki je
% prirejena  dani  racionalni  Bezierjevi  krivulji ,
%   we    seznam  dolžine n+2, v katerem  vsak  element
% predstavlja  utež  racionalne  Bezierjeve  krvulje
% stopnje n+1, ki je  prirejena  dani  racionalni
% Bezierjevi  krivulji

[n,d] = size(B); %velikost in dimenzija
BPOS = zeros(n,d+1); %nove polinomske kontrolne toèke n*(d+1) oblike (w_i*b_i,w_i)
for i = 1:n
    for j = 1:d
        BPOS(i,j) = w(i)*B(i,j); % lahko tudi brez zanke j pa greš BPOS(i, 1:d)=w(i)*B(i,:);
    end
    BPOS(i,d+1) = w(i);
end
BB = bezierelv1(BPOS);%povišamo stopnjo kontrolnih toèk za ena
Be = zeros(n+1,d);%izraèun kontrolnih toèk
we = BB(:,d+1);
for i = 1:n+1
    for j = 1:d
        Be(i,j) =  BB(i,j)/we(i);
    end
end

end