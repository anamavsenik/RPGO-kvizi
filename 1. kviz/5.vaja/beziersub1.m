function BS = beziersub1 (B , t) %to je subdivizija, samo da jo izvedemo samo enkrat. Torej naredi le en korak.
[n,d] = size(B);
BS = cell(1, 2, 3);
d1 = decasteljau(B(:, 1), t); %decasteljeu na prvih komponentah
d2 = decasteljau(B(:, 2), t); %decasteljeu na y
d3 = decasteljau(B(:, 3), t);
BS{1} = [d1(1,:)' d2(1,:)' d3(1,:)']; %v prvo matriko zložimo prvo vrstico obeh
BS{2} = [diag(fliplr(d1)) diag(fliplr(d2)) diag(fliplr(d3))]; %zložimo v to matriko diagonalo obeh, 
%moraš okol obrnt da ne dobiš drugega diagonalca
end