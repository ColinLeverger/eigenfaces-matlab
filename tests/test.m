% Load test image
image_test = load_image('./att_faces/s13/6.pgm',0);
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
% Repmat
d_img = repmat(d_img,200,1);

d2 = d_img - d_db;
res = d2 * transpose(d2);
diagonal = diag(res);

% Sort diagonal values to display the three first similar pics
[diagonal_sorted,diagonal_original_index]=sort(diagonal,'ascend');

%[val,ind] = min(diagonal);
recognized_image=[];
for i = 1:3
    recognized_image_in_line = T_db(diagonal_original_index(i),:);
    recognized_image = [recognized_image reshape(recognized_image_in_line,[56,46])];
end

%recognized_image_in_line = T_db(ind,:);
%recognized_image = reshape(recognized_image_in_line,[56,46]);

comparison = [image_test recognized_image];
%show_image(recognized_image);
show_image(comparison);
