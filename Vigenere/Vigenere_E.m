function C = Vigenere_E(P, K)
    fprintf(strcat(" Plaintext is : ", P))
    fprintf("\n")
    P = P - 'a';
    K_len = strlength(K);
    K = K - 'A';
    C = [];
    idx = 1;
    for p = P
        k_idx = mod(idx, K_len);
        if k_idx == 0
            k_idx = K_len;
        end
        C(idx) = mod(p + K(k_idx), 26) + 'A';
        idx = idx + 1;
    end
    fprintf(strcat("Ciphertext is : ", char(C)))
    fprintf("\n")
end