% TEST

% % 1. del

% Potenèna baza v Bernsteinovo
power2bernstein (1) % 1
power2bernstein ([0 1]) % [1 1]
power2bernstein ([0 0 1]) % [1 1 1]
power2bernstein ([1 0]) % [0 1]
power2bernstein ([0 1 0]) % [0 0.5 1]
power2bernstein ([0 0 1 0]) % [0 0.3333 0.6667 1]

% Obratno kot zgoraj
bernstein2power ([0 0.3333 0.6667 1])
bernstein2power ([0 0.5 1])
bernstein2power ([0 1])
bernstein2power ([1 1 1])
bernstein2power ([1 1])
bernstein2power (1)

% % 2. del

% Izris Bernsteinovih baznih polinomov stopnje n

% Izbira n
n = 5;
n = n + 1;

hold on

for i = 1:n
    p = zeros(1,n);
    p(i) = 1;
    % Definirani na 0 do 1
    x = linspace(0, 1);
    % Izraèun vrednosti
    px = polyval(bernstein2power(p), x);
    % Izris
    plot(x, px);
end

hold off