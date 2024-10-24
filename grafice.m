function grafice(norme_proj, timp_proj, norme_fw, timp_fw)
    figure;
    subplot(2, 1, 1);
    semilogx(1:length(norme_proj), norme_proj, 'DisplayName', 'Gradient Proiectat');
    hold on;
    semilogx(1:length(norme_fw), norme_fw, 'DisplayName', 'Frank-Wolfe');
    hold off;
    xlabel('Iterații');
    ylabel('Norma Diferentei');
    title('Norma Diferentei peste Iterații');
    legend;

    subplot(2, 1, 2);
    semilogx(cumsum(timp_proj), norme_proj, 'DisplayName', 'Gradient Proiectat');
    hold on;
    semilogx(cumsum(timp_fw), norme_fw, 'DisplayName', 'Frank-Wolfe');
    hold off;
    xlabel('Timp (s)');
    ylabel('Norma Diferentei');
    title('Norma Diferentei peste Timp');
    legend;
end
