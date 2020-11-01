function P = Decoder(C, K)
    fprintf(strcat('Ciphertext is : ', string(C)))
    fprintf('\n')
    for idx = length(K(:, 1)):-1:1
        key = K(idx, :);
        L = C(1:2); R = C(3:4);
        f = round_function(R, key);
        L_ = R;
        R_ = getNextRight(L, f);
        if idx == 1
            C = char(strcat(R_, L_));
        else
            C = char(strcat(L_, R_));
        end
    end
    P = C;
    fprintf(strcat('Plain text is : ', string(P)))
    fprintf('\n')
end