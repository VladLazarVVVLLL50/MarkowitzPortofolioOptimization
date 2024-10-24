function [w_fw, randament_asteptat, volatilitate, norme, timp] = metoda_frank_wolfe(alpha, Sigma, alpha0, m)
    max_iter = 1000; 
    tol = 1e-6; 
    w_fw = ones(m, 1) / m; 
    norme = zeros(max_iter, 1);
    timp = zeros(max_iter, 1);

    for k = 1:max_iter
        tic;
        grad = 2 * Sigma * w_fw; 
        f = grad';
        Aeq = [alpha'; ones(1, m)];
        beq = [alpha0; 1];
        lb = zeros(m, 1);
        ub = ones(m, 1);
        options = optimoptions('linprog', 'Display', 'none');
        s = linprog(f, [], [], Aeq, beq, lb, ub, options);
        eta = 2 / (k + 2); 
        w_fw_prev = w_fw;
        w_fw = (1 - eta) * w_fw + eta * s;
        norme(k) = norm(w_fw_prev - w_fw);
        timp(k) = toc; 
        if norme(k) < tol
            norme = norme(1:k);
            timp = timp(1:k);
            break;
        end
    end

    randament_asteptat = alpha' * w_fw; 
    volatilitate = sqrt(w_fw' * Sigma * w_fw); 
end
