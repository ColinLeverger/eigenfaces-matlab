function [U,S,E] = create_e(T2,size_E)
    %create_e: create the eigenfaces from T2
    % usage: [U,S,E] = create_e(T2)
    % note: we only need E here
    %
    % where,
    %    T2 is the image.
    %    E are the eigenfaces.
    C = cov(T2);
    [U,S,E] = svd(C);
    E = E(:,1:1:size_E);
end

