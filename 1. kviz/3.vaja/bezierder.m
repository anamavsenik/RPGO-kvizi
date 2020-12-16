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
% r- tega odvoda pri istoležnem parametru iz seznama t

[n, d] = size(B);
m = length(t);
db = NaN(m, d);

for i=1:d
    for j=1:m %raèunamo odvode za vsak t, torej toèko smo fiksirali in pogledali pri vsakem tju rti odvod
        shema = decasteljau(B(:,i), t(j));%nariše decaste.shemo
        d = diff(shema(:, n-r), r);%izraèuna diferenco, torej razliko tolikokrat kolikor je višina odvoda
        db(j, i) = d(1)*factorial(n)/factorial(n-r);%po formuli, na vektorju se diferenca pojavi na 1.mestu
    end %pri prejšni vrstici moraš vzeti d(1) saj je naslednji NaN ker je paè po dve krèil in prišel je na koncu do dveh
end

end