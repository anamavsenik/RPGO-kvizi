function db = bezierder (B ,r , t )
% Opis :
% bezierder vrne to?ke na krivulji , ki predstavlja odvod
% dane Bezierjeve krivulje
%
% Definicija :
% db = bezierder (B,r,t)
%
% Vhodni podatki :
% B matrika kontrolnih to?k Bezierjeve krivulje , v
% kateri vsaka vrstica predstavlja eno kontrolno
% to?ko ,
% r stopnja odvoda , ki ga ra?unamo ,
% t seznam parameterov , pri katerih ra?unamo odvod
%
% Izhodni podatek :
% db matrika , v kateri vsaka vrstica predstavlja to?ko
% r- tega odvoda pri istole�nem parametru iz seznama t

[n, d] = size(B);
m = length(t);
db = NaN(m, d);

for i=1:d
    for j=1:m %ra�unamo odvode za vsak t, torej to�ko smo fiksirali in pogledali pri vsakem tju rti odvod
        shema = decasteljau(B(:,i), t(j));%nari�e decaste.shemo
        d = diff(shema(:, n-r), r);%izra�una diferenco, torej razliko tolikokrat kolikor je vi�ina odvoda
        db(j, i) = d(1)*factorial(n)/factorial(n-r);%po formuli, na vektorju se diferenca pojavi na 1.mestu
    end %pri prej�ni vrstici mora� vzeti d(1) saj je naslednji NaN ker je pa� po dve kr�il in pri�el je na koncu do dveh
end

end