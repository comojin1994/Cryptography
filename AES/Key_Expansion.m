function round_key = Key_Expansion(key, len_of_key)
    round_key = reshape(hex2dec(reshape(key,2,[])'),4,[]);
    for i = len_of_key : 4 * (len_of_key + 7) -1
        
        temp_key = round_key(:, i);
        
        if mod(i, len_of_key) == 0
            temp_key = SubBytes(circshift(temp_key,-1));
            n=1; m=0;
            while m < i / len_of_key - 1
                n = xtime(2,n); m = m+1;
            end
            temp_key = bitxor(temp_key,[n,0,0,0]'); 
        elseif (mod(i, 8) == 4) && (len_of_key > 6)
            temp_key = SubBytes(temp_key);
        end
        
        r_key = round_key(:, i - len_of_key + 1);
        round_key(:, i+1) = bitxor(r_key, temp_key);
    end
end