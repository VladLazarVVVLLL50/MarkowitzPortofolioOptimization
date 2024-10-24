function [w_proj, randament_asteptat, volatilitate, norme, timp] = metoda_gradient_proiectat(alpha, Sigma, alpha0, m)
    
    L = max(eig(Sigma)); 
    eta = 1 / L;  % pasul
    max_iter = 1000; 
    tol = 1e-6; 
    w_proj = ones(m, 1) / m; % ponderi initiale egale pentru fiecare activa
    norme = zeros(max_iter, 1);
    timp = zeros(max_iter, 1);

    for k = 1:max_iter
        tic;
        grad = Sigma * w_proj;
        w_proj_aux = w_proj;
        w_proj_temp = w_proj - eta * grad;
        w_proj = proiecteaza_pe_simplex_cu_randament(w_proj_temp, alpha, alpha0);
        norme(k) = norm(w_proj_aux - w_proj);
        timp(k) = toc;
        if norme(k) < tol
            norme = norme(1:k);
            timp = timp(1:k);
            break;
        end
    end

    randament_asteptat = alpha' * w_proj;
    volatilitate = sqrt(w_proj' * Sigma * w_proj);
end

function w = proiecteaza_pe_simplex_cu_randament(v, alpha, alpha0)
    max_iter = 100;
    tol = 1e-8;
    m = length(v);
    w = proiecteaza_pe_simplex(v);
    for iter = 1:max_iter
        profit_curent = alpha' * w;
        ajustare = alpha0 - profit_curent;
        pas_ajustare = ajustare / norm(alpha)^2;
        w = w + pas_ajustare * alpha;
        w = proiecteaza_pe_simplex(w);
        if abs(ajustare) < tol
            break;
        end
    end
end

function w = proiecteaza_pe_simplex(v)
    u = sort(v, 'descend');
    sv = cumsum(u) - 1;
    rho = find(u > (sv ./ (1:length(u))'), 1, 'last');
    theta = sv(rho) / rho;
    w = max(v - theta, 0);
end
