function w = adjust_to_target_return(w, alpha, alpha0)
    % Compute the current return
    current_return = alpha' * w;
    % Compute the adjustment factor
    adjustment_factor = alpha0 / current_return;
    % Adjust weights
    w = w * adjustment_factor;
    % Project onto the simplex again to ensure non-negativity and sum to one
    w = project_to_simplex(w);
end
