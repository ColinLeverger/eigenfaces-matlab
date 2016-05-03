function [U,S,E] = create_e(T2)
    C = cov(T2);
    [U,S,E] = svd(C);
    E = E(:,1:1:48);
end

