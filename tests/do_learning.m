% Script to do the learning
function do_learning(number_of_images,nat_sort,size_E)
    % Load raw data
    T = load_raw_images('./att_faces/',number_of_images,nat_sort);
    [m,S] = create_m_and_s(T);
    % Normalize images
    T2 = normalize(T,m,S);

    % Write data in DB in CSV format.
    write_in_db(T,'./data/T.csv');
    write_in_db(m(1,:),'./data/m.csv');
    write_in_db(S(1,:),'./data/S.csv');

    % Create & write eigenfaces
    [U,S,E] = create_e(T2,size_E);
    write_in_db(E,'./data/E.csv');
    %display_eigenfaces(E);
    
    % Create & write descriptors of images
    d = create_d(T2,E);
    write_in_db(d,'./data/d.csv');
end