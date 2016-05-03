function [dir] = remove_dots_from_dir_listing(dir_listing)
    %remove_dots_from_dir_listing
    % usage: [dir] = remove_dots_from_dir_listing(dir_listing)
    %
    % where,
    %    dir_listing is the dir listing with dots ('.' && '..')
    dir = dir_listing(arrayfun(@(x) x.name(1), dir_listing) ~= '.');
end