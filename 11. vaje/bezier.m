function b = bezier (B , t )
% Opis :
% bezier vrne to?ke na Bezierjevi krivulji pri danih
% parametrih
%
% Definicija :
% b = bezier (B,t)
%
% Vhodna podatka :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dolžine k, pri katerih ra?unamo
% vrednost Bezierjeve krivulje
%
% Izhodni podatek :
% b matrika velikosti k x d, kjer i-ta vrstica
% predstavlja to?ko na Bezierjevi krivulji pri
% parametru iz t na i- tem mestu

[n, d] = size(B);
n = n-1;
k = length(t);

% Konstrukcija matrike
b = zeros(k, d);

for t1 = 1:k
    for i = 1:d
        % Izraèun i-te komponente toèke na bezierovi krivulji pri èasu t = t1
        kord = decasteljau(B(:, i), t(t1)); %vzame B in koordinato od t po vrsti
        b(t1, i) = kord(1, n+1); %t1 je zaporedna št., i gre po dimenzijah,n+1 je zadnja toèka
    end
end

end