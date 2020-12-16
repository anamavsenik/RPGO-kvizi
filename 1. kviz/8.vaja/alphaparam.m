function u = alphaparam(P,a)
% Opis:
%   alphaparam  sestavi  alfa  parametrizacijo  oziroma  delitev
%   domene  na  podlagi  podanih  toèk
%
% Definicija:
%   u = alphaparam(P,alpha)
%
% Vhodna  podatka:
%   P matrika z m+1 vrsticami , v kateri  vsaka  vrstica
% predstavlja  eno toèko ,
%   a parameter , ki  doloèa  alfa  parametrizacijo
%
% Izhodni  podatek:
%   u seznam  parametrov  delitve , ki so  doloèeni  rekurzivno
% tako , da se  trenutnemu  parametru  iz  seznama u
% prišteje z a potencirana  norma  razlike  zaporednih
% toèk iz  seznama P

n = size(P);
u = zeros(1,n(1));

u(1) = 0;

for i = 2:n(1)
   u(i) = u(i-1) + norm(P(i,:)-P(i-1,:))^a;
end