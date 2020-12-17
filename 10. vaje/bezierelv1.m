function  Be = bezierelv1(B)
% Opis:
%   bezierelv1  izvede  visanje  stopnje  dane  Bezierjeve  krivulje za 1
%
% Definicija:
%   Be = bezierelv1(B)
%
% Vhodna  podatka:
%   B matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  tocko
% Bezierjeve  krivulje  stopnje n,
% Izhodni  podatek:
%   Be    matrika  velikosti (n+2) x d, v kateri  vsaka
% vrstica  predstavlja d-dimenzionalno  kontrolno  tocko
% Bezierjeve  krvulje  stopnje n+1, ki  ustreza  dani
% Bezierjevi  krivulji
[a,b] = size(B);

% Ustvarimo matriko kontrolnih toèk
Be = zeros(a+1,b);

% Prva toèka je enaka
Be(1,:) = B(1,:);
% Zadnja toèka je enaka
Be(a+1,:) = B(a,:);

% Toèke nove krivulje (za eno stopnjo višje) raèunamo po formuli
for i=2:a
    Be(i,:) = B(i,:)*(1-((i-1)/a)) + B(i-1,:)*((i-1)/a);
end

end
