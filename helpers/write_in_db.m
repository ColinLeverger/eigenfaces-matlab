function write_in_db(data,file_name)
    %write_in_db: write data on a file
    % usage: write_in_db(data,file_name)
    %
    % where,
    % ARGS:
    %    data is the data (array, ...) we want to write on disk.
    %    file_name: file name.
    
    csvwrite(file_name,data)
end

