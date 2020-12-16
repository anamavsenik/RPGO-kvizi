function Bz = lsqbezier2(m,n,P)
% Opis:
%  lsqbezier2 vrne kontrolne tocke tenzorskega polinoma, ki
%  po metodi najmanjsih kvadratov najbolje aproksimira dane
%  podatke
%
% Definicija:
%  B = lsqbezier2(m,n,P)
%
% Vhodni podatki:
%  m,n      parametra, ki dolocata stopnjo polinoma,
%  P        matrika podatkov, ki v vsaki vrstici vsebuje
%           parametra z intervala [0,1] ter njima
%           pripadajoco vrednost, ki jo aproksimiramo
%
% Izhodni podatek:
%  B        matrika velikosti n+1 x m+1, ki vsebuje
%           koeficiente polinoma, ki po metodi najmanjsih
%           kvadratov najbolje aproksimira dane podatke

[l, d] = size(P);

M = zeros(l,(m+1)*(n+1));
u = P(:,1); % u = 1. stolpec matrike P
v = P(:,2); % v = 2. stolpcem matrike P
f = P(:,3);

for k = 1:l
    for i = 0:n
        for j = 0:m
            M(k,i*(m+1)+j+1) = nchoosek(n,i)*nchoosek(m,j)*(v(k))^i*(1-v(k))^(n-i)*(u(k))^j*(1-u(k))^(m-j);
        end
    end
end

z = M \ f; % v P vzamemo samo z-koordinate
Bz = reshape(z,m+1,n+1)'; % izhodna matrika

end