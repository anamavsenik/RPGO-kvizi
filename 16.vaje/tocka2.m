%2.tocka 14 naloge test

Bx = [0 2 6 8;
      1 3 7 nan;
      2 5 nan nan;
      4 nan nan nan];
  
 By = [0 1 0 -1;
     2 2 3 nan;
     4 3 nan nan;
     5 nan nan nan];
 
 Bz = [-2 1 -2 0;
     4 -2 3 nan;
     0 5 nan nan;
     3 nan nan nan];
 
%Izracun tock na trikotni Bezierjevi ploskvi

%Generiranje trikotne mreze (glej funkcijo trimeshgrid), večja stopnja manjši trikotniki:
[TRI,U] = trimeshgrid(10);

%Izracun tock na trikotni Bezierjevi krpi:

b = bezier3(Bx,By,Bz,U);

%Izris trikotne Bezierjeve krpe(TRI je glede na trikotnik):

trisurf(TRI,b(:,1),b(:,2),b(:,3));
