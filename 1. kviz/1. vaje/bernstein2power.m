function b = bernstein2power ( p )
% Opis :
% bernstein2power pretvori polinom , predstavljen s
% koeficienti v Bernsteinovi bazi, v polinom , predstavljen
% v poten?ni bazi
%
% Definicija :
% b = bernstein2power (p)
%
% Vhodni podatek :
% p seznam koeficientov dolžine n+1 , ki po vrsti
% pripadajo razvoju polinoma stopnje n v Bernsteinovi
% bazi od 0 - tega do n- tega Bernsteinovega baznega
% polinoma
%
% Izhodni podatek :
% b seznam koeficientov dolžine n+1 , ki po vrsti
% pripadajo razvoju polinoma stopnje n v poten?ni
% bazi od x^n do 1

% Ustvarimo vektor b
n = length(p);
b = zeros(1,n);

% Sprehodimo se po vseh potencah in uvporabimo formulo z lista
for i=0:n-1
    for j=i:n-1
        b(j+1) = b(j+1) + (p(i+1)*nchoosek(j, i)*nchoosek(n-1, j)*(-1)^(i+j));
    end
end

% Uredimo potence
b = fliplr(b);

end