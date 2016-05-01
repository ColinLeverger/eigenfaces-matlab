addpath('./helpers');
addpath('./learning');
addpath('./tests');

raw_images = load_raw_images('./att_faces/');
images = images_in_one_line(raw_images);