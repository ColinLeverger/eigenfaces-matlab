function [ perc ] = benchmark(randomise,size_E)
    %BENCHMARK: do benchmark for this eigenfaces algorithm
    % usage: benchmark(randomise,size_E)
    %
    % where,
    %    randomise: boolean, represend if we want to randomize of not our
    %               dataset
    %    size_E is the size of the truncated Eigenfaces we want to use

    perc = zeros(1,9);
    for i = 1:9
        res = zeros(40,40);
        learning_announcement = sprintf('DO LEARNING WITH %d IMAGES',i);
        disp(learning_announcement);
        do_learning(i,randomise,size_E);
        % For each 40 individuals
        for j = 1:40
            % Take all the pictures which are not in DB
            for k = i+1:10
                path_image = sprintf('./att_faces/s%d/%d.pgm',j,k);
                % Test the learning
                class_found = test_learning(path_image,i);
                res(j,class_found) = res(j,class_found)+1;
            end
        end
        % Take the diagonal (ie the good hits)
        res_diagonal = diag(res);
        % Compute percentages of good hits
        perc(i) = sum(res_diagonal(:))/sum(res(:));
    end
end

