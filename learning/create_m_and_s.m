function [m,S] = create_m_and_s(T)
    m = mean(T,1); 
    m = repmat(m,size(T,1),1);
    
    S = std(T,1);
    S = repmat(S,size(T,1),1);
end

