function b = rbezier(B,w,t)
% Opis:
%   rbezier  vrne  to�ke  na  racionalni  Bezierovi  krivulji
%
% Definicija:
%   b = rbezier(B,w,t)
%
% Vhodni  podatki:
%   B matrika  velikosti n+1 x d, v kateri  vsaka  vrstica
% predstavlja  kontrolno  to�ko  racionalne  Bezierjeve
% krivulje  stopnje n v d-dimenzionalnem  prostoru ,
%   w seznam  ute�i  racionalne  Bezierjeve  krivulje ,
%   t seznam  parametrov  dol�ine N, za  katere  se  ra�unajo
% to�ke  na  racionalni  Bezierjevi  krivulji
%
% Izhodni  podatek:
%   b matrika  velikosti N x d, v kateri i-ta  vrstica
% predstavlja  to�ko  na  racionalni  Bezierjevi  krivulji
% pri i-tem  parametru  iz  seznama t

n = length(t);
[~,d] = size(B);
b = zeros(n,d);
for i = 1:n
    tt = t(i);
    b(i,:) = rdecasteljau(B,w,tt); 
end

end