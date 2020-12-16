function [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
% Opis:
%  bezier2 vrne tocke na Bezierjevi ploskvi iz tenzorskega
%  produkta
%
% Definicija:
%  [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate kontrolnih tock,
%  u, v         vrstici dolzine M in N, ki predstavljata
%               parametre v smereh u in v
%
% Izhodni podatki:
%  bx, by, bz   matrike velikosti N x M, ki predstavljajo
%               tocke na Bezierjevi ploskvi:
%               [bx(J,I) by(J,I) bz(J,I)] je tocka pri
%               parametrih u(I) in v(J)

[n1,m1] = size(Bx);
n = n1-1;
m = m1-1;
M = length(u);
N = length(v);
bx = zeros(M,N);
by = zeros(M,N);
bz = zeros(M,N);
Bcela = zeros(m+1,3);

for i = 1:N %gremo po fiksnem v-ju
    for k = 1:m1 %izraèunamo kontrolne toèke na krivulji
        Bcela(k,1) = bezier(Bx(:,k),v(i)); % za x koordinato
        Bcela(k,2) = bezier(By(:,k),v(i)); %y
        Bcela(k,3) = bezier(Bz(:,k),v(i)); %z
    end
    for j = 1:M %gremo po vseh u-jih
        bx(i,j) = bezier(Bcela(:,1),u(j));
        by(i,j) = bezier(Bcela(:,2),u(j));
        bz(i,j) = bezier(Bcela(:,3),u(j));
    end
end

end
