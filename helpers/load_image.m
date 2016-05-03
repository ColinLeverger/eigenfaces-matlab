function [img_matrix] = load_image(path,isRGB)
    %load_image: load an image from a file.
    % usage: [img_matrix] = load_image(path,isRGB)
    %
    % where,
    %    path is the path of the image.
    %    isRGB is the B&Withness of the image.
    % NOTE : the image is loaded in a vector !
    if isRGB == 0
        img_matrix = double(imread(path));
    else
        img_matrix = double(rgb2gray(imread(path)));
    end 
    % Change the two-dimentional image in a vector
    img_matrix = imresize(img_matrix,0.5);
end