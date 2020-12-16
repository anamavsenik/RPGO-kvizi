function b = power2bernstein(p)
% Opis:
%  power2bernstein pretvori polinom, predstavljen s
%  koeficienti v potencni bazi, v polinom, predstavljen
%  v Bernsteinovi bazi
%
% Definicija:
%  b = power2bernstein(p)
%
% Vhodni podatek:
%  p    seznam koeficientov dolzine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v potencni
%       bazi od x^n do 1
%
% Izhodni podatek:
%  b    seznam koeficientov dolzine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v Bernsteinovi
%       bazi od 0-tega do n-tega Bernsteinovega baznega
%       polinoma

% Obrnemo vrstni red koeficientov torej grejo od 1 do x^n
p = fliplr(p); 

% Ustvatrimo vektor b
n = length(p);
b = zeros(1,n); %seznam dolžine n 

% Sprehodimo se po vseh potencah v formuli z lista
% Torej x na ena npr želiš izrazit z bernsteinovimi polinomi, torej boš
% vzel koef od x in potem vem bernsteinovim polinomom od i naprej prišteval
% koeficiente bernsteina, obratna pot je
for i=0:n-1 %ta vzame koeficiente polinoma v navadni bazi
    for j=i:n-1
        b(j+1) = b(j+1) + (p(i+1)*nchoosek(j, i)/nchoosek(n-1, i));
    end
end

end