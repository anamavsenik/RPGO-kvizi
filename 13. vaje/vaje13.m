% VAJE 13: Aproksimacija z Bezierjevimi ploskvami pri MNK

format long

% DODATNA RAZLAGA ASISTENTA:

% Bezierjeva ploskev za m = 6 in n = 5:
N = 50;
[P1,P2,P3] = peaks(N); % size(P1) = size(P2) = size(P3) = [N N]
% P1, P2, P3 so koordinate X Y Z, ki doloèajo funkcijo peaks

P = [(P1(:)+3)/6 (P2(:)+3)/6 P3(:)]; % size(P) = [N^2 3]
% v P morajo biti vse toèke na intervalu [0,1], zato transformiram [-3,3] -> [0,1] 

m = 6;
n = 5;
Bz = lsqbezier2(m,n,P); 
% s funkcijo lsqbezier dobim z-koordinate aproksimacije na toèkah P

[Bx,By] = meshgrid(linspace(-3,3,m+1),linspace(-3,3,n+1)) 
% dobim x- in y-koordinato
% koeficienti v navodilu \sum \sum (koef) * Ber * Ber
% nazaj pretransformiram kot [0,1] -> [-3,3]

% OPOMBA: v navodilu NE slika (x,y) -> x, ampak (x,y) -> x^2
% 1. in 2.stolpec od P-ja zgorej, 3. stolpec = vrednosti funkcije kot P1^2
% noviP = (P1(:)+3)/6 (P2(:)+3)/6 ((P1(:)+3)/6)^2]
% Bz = lsqbezier2(m,n,noviP)

% izraèunamo še toèke na ploskvi
[u,v] = deal(linspace(0,1,10));
[bx,by,bz] = bezier2(Bx,By,Bz,u,v)

% OPOMBA
% nariši s surf(bx,by,bz)
[bx,by,bz] = bezier2(Bx,By,Bx,u,v) 
% surf(bx,by,bz) : dobim ravnino, ki predstavlja polinom x
[bx,by,bz] = bezier2(Bx,By,By,u,v) 
% surf(bx,by,bz) : dobim ravnino, ki predstavlja polinom y

% maksimlna absolutna napaka = oo-norma
[u_1,v_1] = deal(linspace(0,1,50)); % za napako mora biti tukaj 50, da je enake dimenzije kot P
[bx_1,by_1,bz_1] = bezier2(Bx,By,Bz,u_1,v_1);

max_napaka = norm(bz_1(:)-P(:,3),Inf)

% maximalne absolutne napake NI potrebno raèunati za x in y koordinato, ker
% pride skoraj 0 (približno 10^(-15))
% torej razlike med x in bx ter y in by

% GRAFIÈNI PRIKAZ
% surf(bx,by,bz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TESTNI PRIMERI

% PRIMER 1

% Podatki z grafa funkcije peaks:
N = 50;
[P1,P2,P3] = peaks(N);
P = [(P1(:)+3)/6 (P2(:)+3)/6 P3(:)];

% Bezierjeva ploskev za m = 6 in n = 5:

m = 6;
n = 5;

[Bx,By] = meshgrid(linspace(-3,3,m+1),linspace(-3,3,n+1));
Bz = lsqbezier2(m,n,P)

% Izracun vrednosti na mrezi 10 x 10:

[u,v] = deal(linspace(0,1,10));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);

% Maksimalna absolutna napaka na mrezi 50 x 50:

% za napako mora biti tukaj 50, da dobimo ENAKE DIMENZIJE kot P
[u1,v1] = deal(linspace(0,1,50)); 
[bx1,by1,bz1] = bezier2(Bx,By,Bz,u1,v1);
max_napaka1 = norm(bz1(:)-P(:,3),Inf)

% GRAFIÈNI PRIKAZ
% surf(bx1,by1,bz1)

% PRIMER 2

% Podatki z grafa funkcije peaks:
N = 50;
[P1,P2,P3] = peaks(N);
P = [(P1(:)+3)/6 (P2(:)+3)/6 P3(:)];

% Bezierjeva ploskev za m = 9 in n = 10:

m = 9;
n = 10;

[Bx,By] = meshgrid(linspace(-3,3,m+1),linspace(-3,3,n+1));
Bz = lsqbezier2(m,n,P)

% Izracun vrednosti na mrezi 10 x 10:

[u,v] = deal(linspace(0,1,10));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);

% Maksimalna absolutna napaka na mrezi 50 x 50:

% za napako mora biti tukaj 50, da dobimo ENAKE DIMENZIJE kot P
[u2,v2] = deal(linspace(0,1,50)); 
[bx2,by2,bz2] = bezier2(Bx,By,Bz,u2,v2);
max_napaka2 = norm(bz2(:)-P(:,3),Inf)

% GRAFIÈNI PRIKAZ
% surf(bx2,by2,bz2)
