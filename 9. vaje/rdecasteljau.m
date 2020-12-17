function b = rdecasteljau(B,w,t)
% Opis:
%   rdecasteljau  vrne  toèko  na  racionalni  Bezierjevi
%   krivulji , ki je  izraèunana z de  Casteljaujevim
%   postopkom , prirejenim  za  racionalni  primer
%
% Definicija:
%   b = rdecasteljau(B,w,t)
%
% Vhodni  podatki:
%   B matrika , katere  vrstica  predstavlja  koordinate
% kontrolne  toèke  racionalne  Bezierjeve  krivulje ,
%   w seznam  uteži  racionalne  Bezierjeve  krivulje ,
%   t število , ki  doloèa  vrednost  delilnega  parametra v
% de  Casteljaujevem  postopku
%
% Izhodni  podatek:
%   b vrstica , ki  predstavlja  toèko  na  racionalni
% Bezierjevi  krivulji  pri  parametru t

[n,d] = size(B);
W = NaN(n);
W(1,:) = w;
D = zeros(n,n,d);
D(1,:,:) = B;

for r = 2:n
    for i = 1:(n-r)+1
        W(r,i) = (1-t)* W(r-1,i) + t * W(r-1,i+1);
        D(r,i,:) = (1-t)*(W(r-1,i)/W(r,i))*D(r-1,i,:) + t*(W(r-1,i+1)/W(r,i))*D(r-1,i+1,:); 
    end
end
b = [];
for i = 1:d
   b = [b D(n,1,i)] ; %n je število vrstic, 1 je prvi stolpec, i je vektor ki pobere komponente iz usake matrike
end

end