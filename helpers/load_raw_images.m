function [raw_image_set,image_loaded] = load_raw_images(folder_path,number_of_image,randomize)
    %raw_img_set: load raw images set (create T) from a folder path.
    % usage:  [raw_image_set,image_loaded] = load_raw_images(folder_path,number_of_image,randomize)
    %
    % where,
    % ARGS:
    %    folder_path is the path of the considered folder.
    %    number_of_image: number of images we want to load.
    %    randomize: natural sort of image if randomize = 0.
    % RETURNS:
    %    image_loaded: list the images which have been loaded in DB.
    %    raw_image_set: set of loaded images with matrix.
    
    % Dir listing, without dots ('.' && '..')
    dir_listing = remove_dots_from_dir_listing(dir(folder_path));
    
    % Nat sort : s1, s2, s3, ..., s40
    nat_sort_dir_listing = sort_folders(dir_listing);
    
    % For every folder...
    for d = 1:length(nat_sort_dir_listing)
            % Create path for actual folder
            actual_folder = strcat(folder_path,'/',nat_sort_dir_listing(d));
            % List all files in this folder, without '.' && '..' again
            list_files_actual_folder = remove_dots_from_dir_listing(dir(actual_folder{1,1}));
            
            % For every file on actual folder, save the path of every file
            for i = 1:length(list_files_actual_folder)
                files(i,:) = strcat(folder_path,'/',nat_sort_dir_listing(d),'/',list_files_actual_folder(i).name);
            end
            
            % Randomizes selection of images
            if randomize == 1
                % Create c to permute randomly temp
                c = randperm(10,10);
                % Permute
                all_img = files(c,:);
            else
                all_img = sort_nat(files);
            end
            % Take the first images for DB
            img_paths(d,:) = all_img(1:number_of_image);
    end
    
    % Save the size of the paths
    [N,M] = size(img_paths);
    k = 1;
    % Create T, with all images changed in vectors
    for i = 1:N
        for j = 1:M
            raw_img = load_image(char(img_paths(i,j)),0);
            % Transform the two-dimensional array in a one-dimensional
            % vector and store it
            raw_image_set(k,:) = one_line_image(raw_img);
            k = k + 1;
        end
    end
    image_loaded = img_paths;
end
