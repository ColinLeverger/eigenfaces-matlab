%Transform the two-dimentional array in a one-dimentional vector
function data = one_line_image(raw_data)    
    data = raw_data(:)';
end
