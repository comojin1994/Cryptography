function C = AES_E(P, key)
    len_of_key = length(key)/8;
    P = hex2dec(reshape(P,2,[])');
    round_key = Key_Expansion(key,len_of_key);
    feature = Add_RoundKey(reshape(P,4,[]), round_key(:,1:4));
    
    for k = 2:(len_of_key + 6)
        feature = Add_RoundKey(Column_Mix(Row_Shift(SubBytes(feature))), ...
                                round_key(:, 4 * (k-1) + 1: 4 * k));
    end
    
    feature=Add_RoundKey(Row_Shift(SubBytes(feature)),...
            round_key(:, 4 * (len_of_key + 6) + 1: 4 * (len_of_key + 7)));
    C=feature(:); C=upper(dec2hex(C(1:length(P)))'); C=C(:)';
end