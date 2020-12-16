function [b] = bezier(B,t)
% Opis:
%  bezier vrne tocke na Bezierjevi krivulji pri danih
%  parametrih
%
% Definicija:
%  b = bezier(B,t)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne
%       tocke Bezierjeve krivulje stopnje n v
%       d-dimenzionalnem prostoru,
%  t    seznam parametrov dolzine k, pri katerih racunamo
%       vrednost Bezierjeve krivulje
%
% Izhodni podatek:
%  b    matrika velikosti k x d, kjer i-ta vrstica
%       predstavlja tocko na Bezierjevi krivulji pri
%       parametru iz t na i-tem mestu

% size(B); % �t. vrstic, �t. stolpcev
k = length(t); % dol�ina seznama parametrov
d = length(B(1,:)); % dimenzija prostora
b = zeros(k,d);

% vzamemo stolpec iz B (1.stolpec x-koordinata, 2.stolpec y-koordinata)
% na vsakem vektorju naredimo decasteljauja -> dobimo matriko c
% zadnji element c so x-koordinate matrike b, torej x koordinate to�k

for i = 1:d % te�e po vseh stolpcih
    for h = 1:k % te�e po t-ju (za vsako koordinato izra�unamo v vseh t-jih)
        c = decasteljau(B(:,i),t(h));
        b(h,i) = c(1,end); % zadnjo to�ko iz decasteljauja uzamem
    end
end

b;
end