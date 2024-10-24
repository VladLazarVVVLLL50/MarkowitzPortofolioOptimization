function tabel_preturi = preturi_fictive(date, tickere)
    numar_date = length(date);
    numar_tickere = length(tickere);
    preturi = rand(numar_date, numar_tickere) * 100 + 100; % Preturi fictive între 100 și 200
    tabel_preturi = array2table(preturi, 'VariableNames', tickere);
    tabel_preturi = addvars(tabel_preturi, date, 'Before', tickere{1}, 'NewVariableNames', 'Data');
end
