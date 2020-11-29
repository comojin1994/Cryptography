function P = AES_D(C, key)
    len_of_key = length(key)/8;
    C = hex2dec(reshape(C,2,[])');
    round_key = Key_Expansion(key,len_of_key);
    feature=Add_RoundKey(reshape(C,4,[]),...
            round_key(:, 4 * (len_of_key + 6) + 1:4 * (len_of_key + 7)));
    
    for k = (len_of_key + 6):-1:2
        feature=Inv_Column_Mix(Add_RoundKey(Inv_SubBytes(Inv_Row_Shift(feature)),...
                round_key(:,4*(k-1)+1:4*k)));
    end
    
    feature=Add_RoundKey(Inv_SubBytes(Inv_Row_Shift(feature)), round_key(:,1:4));
    P=feature(:)'; P = lower(dec2hex(P(1:length(C)))'); P=P(:)';
end