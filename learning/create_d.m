function [d] = create_d(T2,E)
    %create_d: create d from T2 and E
    % usage: [d] = create_d(T2,E)
    %
    % where,
    % ARGS:
    %    T2 is the image.
    %    E are the eigenfaces.
    % RETURNS:
    %    d: descriptor of the image.	
    d = T2 * E;
end

