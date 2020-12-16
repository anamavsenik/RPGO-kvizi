% TEST

% Matrika toèk
P  = [-4 1;  -2  -1; 0 3; 3 0; 5 2];
% Delitev toèk pri

% enakomerni parametrizaciji
ue = alphaparam(P,0)    % [0 1 2 3 4]
% centripetalni parametrizaciji
uc = alphaparam(P ,0.5) % [0  1.6818  3.7965  5.8563  7.5381]
% tetivni parametrizacii
ut = alphaparam(P,1)    % [0  2.8284  7.3006  11.5432  14.3716]