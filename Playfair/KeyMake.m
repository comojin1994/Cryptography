function K_table = KeyMake(K)
    alpha = (double('A'):double('Z'));
    alpha(alpha == double('J')) = [];
    
    K_table = zeros(5, 5);
    for i = 1:5
        for j = 1:5
            if strlength(K) > 0
                K_table(i, j) = K(1);
                alpha(alpha == K(1)) = [];
                K(K == K(1)) = [];
            else
                K_table(i, j) = alpha(1);
                alpha(1) = [];
            end
        end
    end
end