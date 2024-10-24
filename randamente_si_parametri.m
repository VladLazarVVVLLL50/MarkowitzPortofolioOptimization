function [randamente, alpha, Sigma] = randamente_si_parametri(tabel_preturi, tickere)

    preturi = table2array(tabel_preturi(:, 2:end)); % excludem coloana de date
    randamente = diff(log(preturi)); % Utilizarea doar a coloanelor numerice pentru calcularea randamentelor
    alpha = mean(randamente)';
    Sigma = cov(randamente);
   
end
