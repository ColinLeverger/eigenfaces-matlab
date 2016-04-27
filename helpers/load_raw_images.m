% load raw images
function raw_img_set = load_raw_images(folder_path)
    %folder = uigetdir;
    folder = folder_path;
    dir_listing = dir(folder);
    % remove dot from directory listing
    dir_listing = dir_listing(arrayfun(@(x) x.name(1), dir_listing) ~= '.');

    img_paths=[];
    for d = 1:length(dir_listing)
        if dir_listing(d).isdir
            actual_folder = strcat(folder,'/',dir_listing(d).name);
            list_files_actual_folder = dir(actual_folder);
            % Remove dot from directory listing
            list_files_actual_folder = list_files_actual_folder(arrayfun(@(x) x.name(1), list_files_actual_folder) ~= '.');
            
            files=[];
            for d2 = 1:10
                file = strcat(folder,'/',dir_listing(d).name,'/',list_files_actual_folder(d2).name);
                files = [files;cellstr(file);];
            end
            all_img = sort_nat(files);
            img_paths = [img_paths;all_img(1:5);];
        end
    end
    
    raw_img_set=[];
    for i=1:size(img_paths)
        raw_img_set=[raw_img_set;imresize(load_image(char(img_paths(i)),0),0.5);];
    end
end
