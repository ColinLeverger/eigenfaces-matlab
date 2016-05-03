function [m,S] = create_m_and_s(T)
    %create_m_and_s: create the mean and the std from T
    % usage: [m,S] = create_m_and_s(T)
    %
    % where,
    %    m is the mean.
    %    S is the std value 
    m = mean(T,1); 
    m = repmat(m,size(T,1),1);
    
    S = std(T,1);
    S = repmat(S,size(T,1),1);
end

