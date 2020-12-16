function B = beziercubspline(u,D)
% Opis:
%   beziercubspline  izraèuna  sestavljeno  Bezierjevo  krivuljo
%   stopnje 3, ki je  dvakrat  zvezno  odvedljiva v stikih
%
% Definicija:
%   B = beziercubspline(u,D)
%
% Vhodna  podatka:
%   u seznam  parametrov  delitve  dolžine m+1,
%   D matrika , v kateri  vsaka  izmed m+3  vrstic  predstavlja
% eno  kontrolno  toèko  sestavljene  krivulje
%
% Izhodni  podatek:
%   B seznam  dolžine m, v kateri  je vsak  element  matrika s
% štirimi  vrsticami , ki  doloèajo  kontrolne  toèke  kosa
% sestavljene  krivulje

m = size(u);
m = m(2)-1;
[n, d] = size(D);

% Ustvarimo celico
B = cell(1,m);
% Ustvarimo matrike v celicah
for i = 1:m
    B{i} = zeros(4,d);
end
% Vektor diferenc
dif = diff(u);

% Pogoji na zaèetku, v zaèetku vemo, kakšne so prve 3 vrstice
B{1}(1,:) = D(1,:);
B{1}(2,:) = D(2,:);
B{1}(3,:) = (dif(2) / (dif(1) + dif(2))) * D(2,:) + (dif(1) / (dif(1) + dif(2))) * D(3,:);

% Pogoji na koncu, v zadnji matriki vemo kakšne so zadnje 3 vrstice
B{m}(4,:) = D(m+3,:);
B{m}(3,:) = D(m+2,:);
B{m}(2,:) = (dif(m) / (dif(m-1) + dif(m))) * D(m+1,:) + (dif(m-1) / (dif(m-1) + dif(m))) * D(m+2,:);

% Vmesni pogoji 1 (b_1^(i+1), b_2^(i+1))
%poraèunamo toèke v 2 in 3 vrstici matrike, kjer se toèke naraèunajo po
%formuli
for i = 2:m-1
    B{i}(2,:) = ((dif(i) + dif(i+1)) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+1,:) + (dif(i-1) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+2,:);
    B{i}(3,:) = (dif(i+1) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+1,:) + ((dif(i) + dif(i-1)) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+2,:);
end

% Vmesni pogoji 2 (b_3^(i), b_0^(i+1)) v vsaki matriki je seveda zadnja
% toèka prejšne matrike enaka prvi toèki naslednje. to lahko avtomatsko
% filamo
for i = 2:m
    a = dif(i) / (dif(i) + dif(i-1)) * B{i-1}(3,:) + dif(i-1) / (dif(i) + dif(i-1)) * B{i}(2,:);
    B{i-1}(4,:) = a;
    B{i}(1,:) = a;
end