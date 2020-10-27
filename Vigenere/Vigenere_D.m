function P = Vigenere_D(C, K)
    fprintf(strcat("Ciphertext is : ", C))
    fprintf("\n")
    C = C - 'A';
    K_len = strlength(K);
    K = K - 'A';
    P = [];
    idx = 1;
    for c = C
        k_idx = mod(idx, K_len);
        if k_idx == 0
            k_idx = K_len;
        end
        P(idx) = mod(c - K(k_idx), 26) + 'a';
        idx = idx + 1;
    end
    fprintf(strcat(" Plaintext is : ", char(P)))
    fprintf("\n")
end