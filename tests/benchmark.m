function [ perc ] = benchmark( randomise )
    %BENCHMARK Summary of this function goes here
    %   Detailed explanation goes here

    perc = zeros(1,9);
    for i = 1:9
        res = zeros(40,40);
        learning_announcement = sprintf('DO LEARNING WITH %d IMAGES',i);
        disp(learning_announcement);
        do_learning(i,randomise);
        for j = 1:40
            for k = i+1:10
                path_image = sprintf('./att_faces/s%d/%d.pgm',j,k);
                class_found = test_learning(path_image,i);
                res(j,class_found) = res(j,class_found)+1;
            end
        end
        res_diagonal = diag(res);
        perc(i) = sum(res_diagonal(:))/sum(res(:));
    end
end

