function [w_cvx, randament_asteptat, volatilitate] = metoda_cvx(alpha, Sigma, alpha0)
    m = length(alpha);
    cvx_begin
        variable w_cvx(m)
        minimize( 0.5 * quad_form(w_cvx, Sigma) )
        subject to
            sum(w_cvx) == 1
            alpha' * w_cvx == alpha0
            w_cvx >= 0
    cvx_end
    randament_asteptat = alpha' * w_cvx;
    volatilitate = sqrt(w_cvx' * Sigma * w_cvx);
end
