function P = Add_RoundKey(P, round_key)
    for i=1:4
        P(:,i) = bitxor(P(:,i), round_key(:,i));
    end
end