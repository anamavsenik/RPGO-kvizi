% Izris Bernsteinovih baznih polinomov stopnje n

% Izbira n, polinom stopnje n ima seveda 6 koeficientov
%barve ti spreminja sam
n = 5;
n = n + 1;

hold on

for i = 1:n
    p = zeros(1,n);
    p(i) = 1;
    % Definirani na 0 do 1
    x = linspace(0, 1); %gre po stotinko navzgor in ra�una vrednosti
    % Izra�un vrednosti
    px = polyval(bernstein2power(p), x); %nari�e vse do stopnje najve� 5, torej 
    %iz bernsteinove baze naredi navadno in nato ra�una vrednost v vsaki
    %to�ki x
    %torej pri baznih polnimih stopnje 5 ri�e najprej 1 bazni polinom, nato
    %2. itd. torej vsak bazni bernsteinov posebej. Iz bernstenovega
    %izra�una navadno bazo, vse je stopnje 5 vendar jih je vseh skupaj 6.
    % Izris
    plot(x, px); 
end

hold off