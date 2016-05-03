% load an image
function img_matrix = load_image(path,isRGB)
    if isRGB == 0
        img_matrix = double(imread(path));
    else
        img_matrix = double(rgb2gray(imread(path)));
    end 
    img_matrix = imresize(img_matrix,0.5);
end