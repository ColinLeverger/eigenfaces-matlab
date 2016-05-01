function dir = remove_dots_from_dir_listing(dir_listing)
    dir = dir_listing(arrayfun(@(x) x.name(1), dir_listing) ~= '.');
end