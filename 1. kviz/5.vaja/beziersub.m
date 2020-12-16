function BS = beziersub (B , t, k)
% Opis : beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija :
% BS = beziersub (B,t)
%
% Vhodni podatki :
% B matrika kontrolnih tock Bezierjeve krivulje , v
% kateri vsaka vrstica predstavlja eno kontrolno
% tocko ,
% t parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek :
% BS celica , ki vsebuje kontrolne tocke dveh krivulj , ki
% jih dobimo s subdivizijo prvotne Bezierjeve krivulje

n = length(B); %torej če je B n krat d potem vrže n length, torej število vrstic
BS = cell(1, 2^k); %naredi osem praznih celic, v vsakem koraku razdeli eno na dve novi, torej v 
%prvem koraku iz 1 nastaneta 2, nato deli vsako posebej torej iz 2
%nastanejo 4

d1 = decasteljau(B(:, 1), t); %narišemo decastelje.shemo na prvih točkah (vektor x)
d2 = decasteljau(B(:, 2), t); %narišemo decast.chemo na drugih točkah (vektor y)

BS{1} = [d1(1,:)' d2(1,:)']; %' pomeni transponirano, torej dobimo v tem spodnjo vrstico
% kot prvi element BS-ja ustavimo matriko ki ima kot prvi stolpec prvo vrstico d1 in kot
% drugega prvo vrstico d2
BS{2^(k-1)+1} = [diag(fliplr(d1)) diag(fliplr(d2))]; %dobimo diagonalne vrednosti algoritma
% ki daje vrednosti takoj za prvo vrstico po vrsti, pobere diagonalce od d1 in d2
% ter jih da v 1. in 2. stolpec
for i=2:k %ponavljamo kolikokrat želimo ponoviti algoritem
    for j=1:2^(k-i+1):2^k % bodi pozorna kam fila vrednosti
        d1 = decasteljau(BS{j}(:, 1), t); %zdaj računa decasteljeja za druge vrednosti, drugo matriko
        d2 = decasteljau(BS{j}(:, 2), t);  
        
        BS{j} = [d1(1,:)' d2(1,:)'];
        BS{j+2^(k-i)} = [diag(fliplr(d1)) diag(fliplr(d2))];
    end %fliplr okol obrne seznam, čene bi pobiral diagonalo iz leve proti desni, tako pa obratno
end

clf
hold on
for i=1:2^k
   plot(BS{i}(:,1),BS{i}(:,2))
end
hold off
end