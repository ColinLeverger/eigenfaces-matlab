function [d] = create_d(T2,E)
    %create_d: create d from T2 and E
    % usage: [d] = create_d(T2,E)
    %
    % where,
    %    d is the descriptor of the image.
    %    T2 is the image.
    %    E are the eigenfaces.
    d = T2 * E;
end

