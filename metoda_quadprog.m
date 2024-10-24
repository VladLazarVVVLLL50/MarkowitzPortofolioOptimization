function [w_quadprog, randament_asteptat, volatilitate] = metoda_quadprog(alpha, Sigma, alpha0)
    m = length(alpha);
    Aeq = [ones(1, m); alpha'];
    beq = [1; alpha0];
    lb = zeros(m, 1);
    ub = ones(m, 1);
    H = 2 * Sigma; % termen patratic
    f = zeros(m, 1); % termen liniar (nu exista)
    optiuni = optimoptions('quadprog', 'Display', 'off');
    [w_quadprog, ~] = quadprog(H, f, [], [], Aeq, beq, lb, ub, [], optiuni);
    randament_asteptat = alpha' * w_quadprog;
    volatilitate = sqrt(w_quadprog' * Sigma * w_quadprog);
end
