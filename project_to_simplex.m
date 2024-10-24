function w = project_to_simplex(v)
    % Sort v in descending order
    u = sort(v, 'descend');
    % Compute cumulative sum of sorted values minus one
    sv = cumsum(u) - 1;
    % Find the rho index
    rho = find(u > (sv ./ (1:length(u))'), 1, 'last');
    % Compute the theta value
    theta = sv(rho) / rho;
    % Project v onto the simplex
    w = max(v - theta, 0);
end