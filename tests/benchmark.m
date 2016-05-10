% AKA Overall Accuracy
function [ perc ] = benchmark(randomise,size_E,display_result)
    %benchmark: do benchmark for this eigenfaces algorithm
    % usage: benchmark(randomise,size_E,display_result)
    %
    % where,
    % ARGS:
    %    randomise: boolean, represent if we want to randomize of not our
    %    dataset.
    %    size_E: size of the truncated Eigenfaces we want to use.
    %    display_result: display the neighbours in the test_learning function. 
    % RETURNS:
    %    perc: percentages of success for this benchmark.

    perc = zeros(1,9);
    for i = 1:9
        % Init confusion matrix
        res = zeros(40,40);
        learning_announcement = sprintf('DO LEARNING WITH %d IMAGES',i);
        disp(learning_announcement);
        
        % Do the learning for i images, randomised (or not) and with a size
        % of E of size_E
        image_loaded = do_learning(i,randomise,size_E);
        % Load all images to check differences between loaded images and
        % all images
        [~,all_images] = load_raw_images('./att_faces',10,1);
        
        % Find difference entre all_images available and image_loaded in
        % database (in other words, find the images we will test, the
        % images which are not in DB)
        images_to_test = setdiff(all_images,image_loaded);

        % For every images which are not in DB...
        for j = 1:size(images_to_test,1)
            path_of_actual_image = char(images_to_test(j));
            
            % Test learning
            class_found = test_learning(path_of_actual_image,i,display_result);
            
            % Find class of actual image (with regex in name of the path)
            nums_in_path = regexp(path_of_actual_image,'([0-9]+)','match');
            % FIXME -> Why should I str2num a char ...??
            class_of_image = str2num(char(nums_in_path(1)));
            
            % Update res
            res(class_of_image,class_found) = res(class_of_image,class_found)+1;
        end
            
        % Take the diagonal (ie the good hits)
        res_diagonal = diag(res);
        % Compute percentages of good hits
        perc(i) = sum(res_diagonal(:))/sum(res(:));
    end
end

