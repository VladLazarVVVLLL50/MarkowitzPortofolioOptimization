clc; clear;

% Titluri de active
tickere = {'AAPL', 'MSFT', 'GOOGL', 'AMZN', 'META', 'TSLA', 'BRK.B', 'JNJ', 'JPM', 'V', ...
           'PG', 'NVDA', 'HD', 'MA', 'DIS', 'PYPL', 'VZ', 'PFE', 'INTC', 'KO', ...
           'T', 'PEP', 'MRK', 'CSCO', 'NKE'};

% Interval de date istorice
date = (datetime('2020-01-01'):calmonths(1):datetime('2023-01-01'))';

% Generam un set de date fictive
tabel_preturi = preturi_fictive(date, tickere);

disp('Preturile la inchidere:');
disp(tabel_preturi);

% Calcularea randamentelor și a parametrilor pentru optimizare
[randamente, alpha, Sigma] = randamente_si_parametri(tabel_preturi, tickere);

% Definirea randamentului tintă (alpha0)
alpha0 = 0.01; %  

% Numarul de active (m)
m = length(alpha);

%% Quadprog
[w_quadprog, randament_asteptat_quadprog, volatilitate_quadprog] = metoda_quadprog(alpha, Sigma, alpha0);

%% CVX
[w_cvx, randament_asteptat_cvx, volatilitate_cvx] = metoda_cvx(alpha, Sigma, alpha0);

%% Metoda Gradient Proiectat
[w_proj, randament_asteptat_proj, volatilitate_proj, norme_proj, timp_proj] = metoda_gradient_proiectat(alpha, Sigma, alpha0, m);

%% Metoda Gradient Conditionat (Frank-Wolfe)
[w_fw, randament_asteptat_fw, volatilitate_fw, norme_fw, timp_fw] = metoda_frank_wolfe(alpha, Sigma, alpha0, m);

%% Rezultate
afisare(w_quadprog, randament_asteptat_quadprog, volatilitate_quadprog, ...
        w_cvx, randament_asteptat_cvx, volatilitate_cvx, ...
        w_proj, randament_asteptat_proj, volatilitate_proj, ...
        w_fw, randament_asteptat_fw, volatilitate_fw);

%% Normele Gradientilor dupa numarul de iteratii si dupa timp
grafice(norme_proj, timp_proj, norme_fw, timp_fw);


