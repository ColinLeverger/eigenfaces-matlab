% load raw images
function rawImgSet = loadRawImages()
    folder = uigetdir;
    dirListing = dir(folder);
    dirListing = dirListing(arrayfun(@(x) x.name(1), dirListing) ~= '.');

    imgPaths=[];
    for d = 1:length(dirListing)
        if dirListing(d).isdir
            actualFolder = strcat(folder,'/',dirListing(d).name);
            listFilesActualFolder = dir(actualFolder);
            listFilesActualFolder = listFilesActualFolder(arrayfun(@(x) x.name(1), listFilesActualFolder) ~= '.');
            
            files=[];
            for d2 = 1:10
                file = strcat(folder,'/',dirListing(d).name,'/',listFilesActualFolder(d2).name);
                files = [files;cellstr(file);];
            end
            allImg = sort_nat(files);
            imgPaths = [imgPaths;allImg(1:5);];
        end
    end
    rawImgSet=[];
    for i=1:size(imgPaths)
        rawImgSet=[rawImgSet;imresize(loadImage(char(imgPaths(i)),0),0.5);];
    end
end
