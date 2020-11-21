function  [roundKey, roundKey_dec] = round_key_gen(K, print)
    roundKey = zeros(16,48);
    roundKey_dec = zeros(16,12);
    
    Pbox1 = [ 57, 49, 41, 33, 25, 17 , 9, ...
     1, 58, 50, 42, 34, 26, 18, ...
     10, 2, 59, 51, 43, 35, 27, ...
     19, 11, 3, 60, 52, 44, 36, ...
     63, 55, 47, 39, 31, 23, 15, ...
     7, 62, 54, 46, 38, 30, 22, ...
     14, 6, 61, 53, 45, 37, 29, ...
     21, 13, 5, 28, 20, 12, 4 ];

    Pbox2 = [ 14, 17, 11, 24, 1, 5 , 3, 28, ...
     15, 6, 21, 10, 23, 19, 12, 4, ...
     26, 8, 16, 7, 27, 20, 13, 2, ...
     41, 52, 31, 37, 47, 55, 30, 40, ...
     51, 45, 33, 48, 44, 49, 39, 56, ...
     34, 53, 46, 42, 50, 36, 29, 32];

    rot = [1, 1, 2, 2, 2, 2, 2, 2, 1, 2, ...
     2, 2, 2, 2, 2, 1];
 
 
    key_p = K(Pbox1(1:56));
    key_c = key_p(1:28);
    key_d = key_p(29:56);
    
    for i=1:16
    
        key_p_c = circshift(key_c,[0 -1*rot(i)]);
        key_p_d= circshift(key_d,[0 -1*rot(i)]);
        key_p_shifted = horzcat(key_p_c, key_p_d);

        finalKey = key_p_shifted(Pbox2(1:48));
        
        roundKey(i,:) = finalKey;
        
        j = 1;
        for k=1:8
            roundKey_dec(i,k) = bi2de(finalKey(j:j+5),'left-msb');
            j=j+6;
        end

        key_c = key_p_c;
        key_d = key_p_d;
    end
    
    if print
        disp(roundKey_dec);
    end
    
end


    
