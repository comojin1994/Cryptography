function C = Playfair_E(P, K)
    fprintf(strcat(" Plaintext is : ", P))
    fprintf("\n")
    K_table = KeyMake(K);
    P = preprocess(P);
    C = [];
    
    for i = 1:2:strlength(P)
        [x1, y1, x2, y2] = getIndex(K_table, P, i);
        
        if x1 ~= x2 && y1 ~= y2
            C(i) = K_table(x1, y2);
            C(i+1) = K_table(x2, y1);
        elseif x1 == x2
            y1_ = mod(y1 + 1, 5);
            if y1_ == 0
                y1_ = 5;
            end
            y2_ = mod(y2 + 1, 5);
            if y2_ == 0
                y2_ = 5;
            end
            C(i) = K_table(x1, y1_);
            C(i+1) = K_table(x2, y2_);
        elseif y1 == y2
            x1_ = mod(x1 + 1, 5);
            if x1_ == 0
                x1_ = 5;
            end
            x2_ = mod(x2 + 1, 5);
            if x2_ == 0
                x2_ = 5;
            end
            C(i) = K_table(x1_, y1);
            C(i+1) = K_table(x2_, y2);
        end
    end
    fprintf(strcat("Ciphertext is : ", char(C)))
    fprintf("\n")
end