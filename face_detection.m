addpath('./helpers');
addpath('./learning');
addpath('./tests');

T = load_raw_images('./att_faces/');
[m,S,T2] = normalize(T);
write_in_db(m(1,:),'./data/m.csv');
write_in_db(S(1,:),'./data/S.csv');
[U,S,E] = create_e(T2);
write_in_db(E,'./data/E.csv');
d = create_d(T2,E);
display_eigenfaces(E);
write_in_db(d,'./data/d.csv');