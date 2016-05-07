%Transform the two-dimentional array in a one-dimentional vector
function [one_lined_img] = one_line_image(raw_data)   
    %one_line_image: change an two-dimentional image on a on-dimentional 
    % vector.
    % usage: [data] = one_line_image(raw_data)
    %
    % where,
    % ARGS:
    %    raw_data is the image in a raw form (two-dimentions, see: 
    % RETURNS:
    %    one_lined_img is our image in one line.
    % NOTE:
    %    img = [ 1 , 2 , 3 , ... ; 1 , 2 , 3 , ... ; ... ; ... ])
    
    one_lined_img = raw_data(:)';
end
