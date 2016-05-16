% Script to do the learning
function [image_loaded] = do_learning(number_of_images,randomize,size_E)
    %do_learning: do machine learning for number_of_images images
    % usage: [image_loaded] = do_learning(number_of_images,randomize,size_E)
    %
    % where,
    % ARGS:
    %    number_of_images: number of images we want to put in DB.
    %    randomize: randomized selection of images.
    %    size_E: size of the truncated Eigenfaces we want to use.
    % RETURNS:
    %    image_loaded: paths of loaded images (i.e. images that are in DB)
    
    % Load raw data
    [T,image_loaded] = load_raw_images('./att_faces',number_of_images,randomize);
    [m,S] = create_m_and_s(T);
    % Normalize images
    T2 = normalize(T,m,S);

    % Write data in DB in CSV format.
    write_in_db(T,'./data/T.csv');
    write_in_db(m(1,:),'./data/m.csv');
    write_in_db(S(1,:),'./data/S.csv');

    % Create & write eigenfaces~
    [~,~,E] = create_e(T2,size_E);
    write_in_db(E,'./data/E.csv');
    %display_eigenfaces(E);
    
    % Create & write descriptors of images
    d = create_d(T2,E);
    write_in_db(d,'./data/d.csv');
end