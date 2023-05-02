l = 5; % dimensiunea lungimii tablei
h = 4; % dimensiunea înălțimii tablei

% Matricea care descrie tabla
tabla = zeros(l, h);
tabla(1, 2) = 1; % primul orificiu
tabla(2, 3) = 1; % al doilea orificiu
tabla(4, 1) = 1; % al treilea orificiu

% Inițializăm matricea dp cu valori de 0
dp = zeros(l+1, h+1);

% Parcurgem matricea de la dreapta la stânga și de sus în jos
for i = l:-1:1
  for j = h:-1:1
    % Dacă există un orificiu în această poziție, nu putem forma un dreptunghi aici
    if tabla(i, j) == 1
      dp(i, j) = 0;
    else
      % Altfel, calculăm aria maximă a unui dreptunghi care începe în această celulă
      % și care nu conține niciun orificiu dat
      dp(i, j) = (1 + dp(i+1, j)) * (1 + dp(i, j+1));
    end
  end
end

% Aria maximă este dată de valoarea maximă din matricea bidimensionala dp
aria_maxima = max(max(dp));

% Afisare arie maxima
disp(aria_maxima);
