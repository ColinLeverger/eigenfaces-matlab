function [raw_img_set] = load_raw_images(folder_path,number_of_image,nat_sort)
    %raw_img_set: load raw image set (create T) from a folder path.
    % usage:  [raw_img_set] = load_raw_images(folder_path)
    %
    % where,
    %    folder_path is the path of the considered folder.
    
    % Dir listing, without dots ('.' && '..')
    dir_listing = remove_dots_from_dir_listing(dir(folder_path));
    
    % Nat sort : s1, s2, s3, ..., s40
    nat_sort_dir_listing = sort_folders(dir_listing);
    
    % For every folders...
    for d = 1:length(nat_sort_dir_listing)
            % Create path for actual folder
            actual_folder = strcat(folder_path,'/',nat_sort_dir_listing(d));
            % List all files in this folder, without '.' && '..' again
            list_files_actual_folder = remove_dots_from_dir_listing(dir(actual_folder{1,1}));
            
            % For every file on actual folder, save path of every files
            for i = 1:length(list_files_actual_folder)
                files(i,:) = strcat(folder_path,'/',nat_sort_dir_listing(d),'/',list_files_actual_folder(i).name);
            end
            if nat_sort == 1
                all_img = sort_nat(files);
            else
                all_img = files;
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
            % Transform the two-dimentional array in a one-dimentional
            % vector and store it
            raw_img_set(k,:) = one_line_image(raw_img);
            k = k + 1;
        end
    end
end
