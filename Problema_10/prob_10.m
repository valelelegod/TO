% Matricea de adiacenta pentru graf (1/2 pentru teste)
first_matrix = [
     0 1 1 1 1 0;
     1 0 1 0 1 0;
     1 1 0 0 1 1;
     1 0 0 0 1 0;
     1 1 1 1 0 1;
     0 0 1 0 1 0];
second_matrix = [0 1 1 1; 1 0 1 0; 1 1 0 1; 1 0 1 0];

% Numarul maxim de culori folosite
max_colors = 4;
% Apelarea functiei welsh_powell.
[coloring, num_colors] = welsh_powell(first_matrix, max_colors);
% Marcarea zonelor utilizand cel mult 4 culori
disp(coloring);
% Numarul maxim de culori ce au fost folosite
disp(num_colors);
