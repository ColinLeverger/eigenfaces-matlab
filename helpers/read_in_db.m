function [csv] = read_in_db(file_name)
    %read_in_db: read value in a DB (which is here a csv file)
    % usage:  [M] = read_in_db(file_name)
    %
    % where,
    % ARGS:
    %    file_name is the file name of the .csv file you want to read.
    % RETURNS:
    %    csv is the value(s) you want to read.

    csv = csvread(file_name);
end

