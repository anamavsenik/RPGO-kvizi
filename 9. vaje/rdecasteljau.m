function b = rdecasteljau(B,w,t)
% Opis:
%   rdecasteljau  vrne  to�ko  na  racionalni  Bezierjevi
%   krivulji , ki je  izra�unana z de  Casteljaujevim
%   postopkom , prirejenim  za  racionalni  primer
%
% Definicija:
%   b = rdecasteljau(B,w,t)
%
% Vhodni  podatki:
%   B matrika , katere  vrstica  predstavlja  koordinate
% kontrolne  to�ke  racionalne  Bezierjeve  krivulje ,
%   w seznam  ute�i  racionalne  Bezierjeve  krivulje ,
%   t �tevilo , ki  dolo�a  vrednost  delilnega  parametra v
% de  Casteljaujevem  postopku
%
% Izhodni  podatek:
%   b vrstica , ki  predstavlja  to�ko  na  racionalni
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
   b = [b D(n,1,i)] ; %n je �tevilo vrstic, 1 je prvi stolpec, i je vektor ki pobere komponente iz usake matrike
end

end