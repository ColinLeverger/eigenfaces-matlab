% Load test image
image_test = load_image('./att_faces/s1/8.pgm',0);
% Change the two-dimentional image in a one-dimentional vector
image_test_one_line = one_line_image(image_test);

% Load data from DB
T_db = read_in_db('./data/T.csv');
E_db = read_in_db('./data/E.csv');
d_db = read_in_db('./data/d.csv');
m_db = read_in_db('./data/m.csv');
S_db = read_in_db('./data/S.csv');

% Normalize test image
image_test_normalised = normalize(image_test_one_line,m_db,S_db);

d_img = image_test_normalised * E_db;
% Repmat in order to compute 
d_img = repmat(d_img,200,1);

% Compute difference between d_img and the d_db which is in the database
d2 = d_img - d_db; 
% Compute the diagonal value, which is the euclidian distribution between
% d_img and d_db
diagonal = diag(d2 * transpose(d2));

% Sort diagonal values in ascending
[diagonal_sorted,diagonal_original_index]=sort(diagonal,'ascend');

% Concat images to display the result
% Here, we take the first N images which are recognized as similar by the
% program
N = 5;
recognized_images=[];
for i = 1:N
    recognized_image_in_line = T_db(diagonal_original_index(i),:);
    recognized_images = [recognized_images reshape(recognized_image_in_line,[56,46])];
end

% Display comparison
comparison = [image_test recognized_images];
show_image(comparison);
