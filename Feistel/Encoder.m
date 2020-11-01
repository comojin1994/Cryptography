function C = Encoder(P, K)
    fprintf(strcat('Plain text is : ', string(P)))
    fprintf('\n')
    for idx = 1:length(K(:, 1))
        key = K(idx, :);
        L = P(1:2); R = P(3:4);
        f = round_function(R, key);
        L_ = R;
        R_ = getNextRight(L, f);
        if idx == length(K(:, 1))
            P = char(strcat(R_, L_));
        else
            P = char(strcat(L_, R_));
        end
    end
    C = P;
    fprintf(strcat('Ciphertext is : ', string(C)))
    fprintf('\n')
end