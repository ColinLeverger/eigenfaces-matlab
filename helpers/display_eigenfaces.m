function display_eigenfaces(E)
    %display_eigenfaces
    % usage: display_eigenfaces(E)
    %
    % where,
    %    E is a cell array (vector) of eigenfaces values.

    % Multiply E by 1500 in order to have something to display
    % Without this multiplication there is nothing to show becaue E's
    % values are two low...
    E = E * 1500 + 128;

    % Compute the eigenfaces
    eigenfaces=[];
    for i = 1:size(E,2)
        eigenface = reshape(E(:,i),[56,46]);
        eigenfaces = [eigenfaces eigenface];
    end
    % Display
    show_image(eigenfaces);
end

