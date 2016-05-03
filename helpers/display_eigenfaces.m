function display_eigenfaces(E)
    E = E * 1500 + 128;
    eigenfaces=[];
    for i = 1:size(E,2)
        eigenface = reshape(E(:,i),[56,46]);
        eigenfaces = [eigenfaces eigenface];
    end
    show_image(eigenfaces);
end

