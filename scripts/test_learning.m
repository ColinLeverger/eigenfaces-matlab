function [first_candidate_class] = test_learning(path,size_of_db,display_result)
    %test_learning: test the machine learning & database
    % usage: [first_candidate_class] = test_learning(path,size_of_db,display_result)
    %
    % where,
    % ARGS:
    %    path: path of image to test.
    %    size_of_db: size of the database we will use (i.e. number of images / individuals 
    %                in DB.
    %    display_result: display comparison between neighbours.
    % RETURNS:
    %    first_candidate_class: first candidate class found by algorithms

    % Load test image
    image_test = load_image(path,0);
    % Change the two-dimensional image in a one-dimensional vector
    image_test_one_line = one_line_image(image_test);

    % Load data from DB
    E_db = read_in_db('./data/E.csv');
    d_db = read_in_db('./data/d.csv');
    m_db = read_in_db('./data/m.csv');
    S_db = read_in_db('./data/S.csv');

    % Normalize test image
    image_test_normalised = normalize(image_test_one_line,m_db,S_db);

    d_img = image_test_normalised * E_db;
    % Repmat in order to compute 
    d_img = repmat(d_img,size(d_db,1),1);

    % Compute difference between d_img and the d_db which is in the database
    d2 = d_img - d_db; 
    % Compute the diagonal value, which is the Euclidian distribution between
    % d_img and d_db
    diagonal = diag(d2 * transpose(d2));

    % Sort diagonal values in ascending
    [~,diagonal_original_index]=sort(diagonal,'ascend');
    % Give the first candidate class
    first_candidate_class = ceil(diagonal_original_index(1)/size_of_db);

    if display_result == 1
        % Display neighbours:
        % Concat images to display the result
        % Here, we take the first N images which are recognized as similar by the
        % program
        T_db = read_in_db('./data/T.csv');    
        N = 3;
        recognized_images=[];
        for i = 1:N
            recognized_image_in_line = T_db(diagonal_original_index(i),:);
            recognized_images = [recognized_images reshape(recognized_image_in_line,[56,46])];
        end

        % Display comparison
        comparison = [image_test recognized_images];
        show_image(comparison);
    end
end