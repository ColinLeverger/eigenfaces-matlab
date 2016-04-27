% load an image
function imgMatrix = loadImage(path,isRGB)
    if isRGB == 0
        imgMatrix = double(imread(path));
    else
        imgMatrix = double(rgb2gray(imread(path)));
    end 
end