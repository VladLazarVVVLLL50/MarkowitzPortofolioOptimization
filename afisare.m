function afisare(w_quadprog, randament_asteptat_quadprog, volatilitate_quadprog, ...
                            w_cvx, randament_asteptat_cvx, volatilitate_cvx, ...
                            w_proj, randament_asteptat_proj, volatilitate_proj, ...
                            w_fw, randament_asteptat_fw, volatilitate_fw)
    disp('Ponderi optimizate folosind quadprog:');
    disp(w_quadprog);
    disp('Randamentul așteptat al portofoliului optimizat folosind quadprog:');
    disp(randament_asteptat_quadprog);
    disp('Volatilitatea (deviația standard) a portofoliului optimizat folosind quadprog:');
    disp(volatilitate_quadprog);

    disp('Ponderi optimizate folosind CVX:');
    disp(w_cvx);
    disp('Randamentul așteptat al portofoliului optimizat folosind CVX:');
    disp(randament_asteptat_cvx);
    disp('Volatilitatea (deviația standard) a portofoliului optimizat folosind CVX:');
    disp(volatilitate_cvx);

    disp('Ponderi optimizate folosind Gradient Proiectat:');
    disp(w_proj);
    disp('Randamentul așteptat al portofoliului optimizat folosind Gradient Proiectat:');
    disp(randament_asteptat_proj);
    disp('Volatilitatea (deviația standard) a portofoliului optimizat folosind Gradient Proiectat:');
    disp(volatilitate_proj);

    disp('Ponderi optimizate folosind Frank-Wolfe:');
    disp(w_fw);
    disp('Randamentul așteptat al portofoliului optimizat folosind Frank-Wolfe:');
    disp(randament_asteptat_fw);
    disp('Volatilitatea (deviația standard) a portofoliului optimizat folosind Frank-Wolfe:');
    disp(volatilitate_fw);

    fprintf('\nCompararea rezultatelor:\n');
    fprintf('Metodă\t\t\t\tRandament Așteptat\t\t\tVolatilitate\n');
    fprintf('Quadprog\t\t\t%.4f\t\t\t\t%.4f\n', randament_asteptat_quadprog, volatilitate_quadprog);
    fprintf('CVX\t\t\t\t%.4f\t\t\t\t%.4f\n', randament_asteptat_cvx, volatilitate_cvx);
    fprintf('Gradient Proiectat\t\t%.4f\t\t\t\t%.4f\n', randament_asteptat_proj, volatilitate_proj);
    fprintf('Frank-Wolfe\t\t\t%.4f\t\t\t\t%.4f\n', randament_asteptat_fw, volatilitate_fw);
end
