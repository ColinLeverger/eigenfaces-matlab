function write_in_db(data,file_name)
    %write_in_db: write data on a file
    % usage: write_in_db(data,file_name)
    %
    % where,
    %    data is the ddata (array, ...) we want to write on disk.
    csvwrite(file_name,data)
end

