function [ m,S,T2 ] = normalize(T)
    m = mean(T,1); 
    m = repmat(m,size(T,1),1);
    
    S = std(T,1);
    S = repmat(S,size(T,1),1);
    
    % './' : division point by point
    T2 = (T - m) ./ S;
end

