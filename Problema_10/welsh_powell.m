## Copyright (C) 2023 ValentinMocanu
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} welsh_powell (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ValentinMocanu <ValentinMocanu@DESKTOP-IS2TS18>
## Created: 2023-05-01
function [coloring, num_colors] = welsh_powell(adj_matrix, max_colors)
  % Se creeaza o lista cu nodurile grafului și cu gradele lor
  node_degrees = sum(adj_matrix, 2);
  node_list = [(1:size(adj_matrix, 1))', node_degrees];

  % Sortam lista descrescător după grade
  sorted_node_list = sortrows(node_list, -2);

  % Apoi initializez toate nodurile cu culoarea 0
  coloring = zeros(size(adj_matrix, 1), 1);

  % Voi parcurge lista nodurilor și asignez pentru fiecare nod culoarea în mod corespunzător
  for i = 1:size(sorted_node_list, 1)
    node = sorted_node_list(i, 1);

    % Verific culorile disponibile
    available_colors = ones(max_colors, 1);
    neighbors = find(adj_matrix(node, :));
    for j = 1:length(neighbors)
      neighbor = neighbors(j);
      neighbor_color = coloring(neighbor);
      % In octave, indexarea cu zero nu e permisa, asa ca vom face o scurta verificare daca este 0
      if(neighbor_color == 0)
        available_colors(1) = 0;
      else
        available_colors(neighbor_color) = 0;
      end
    end

    % Aleg prima culoare disponibilă din array
    color = find(available_colors, 1);
    coloring(node) = color;
  end

  % Returnează numărul de culori utilizate
  num_colors = max(coloring);
endfunction
