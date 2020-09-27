function result = Decoder(text, key)
    result = '';
    ascii = double(text);
    for a = ascii
        mmi = ModMulInv(key(1), 26);
        a = mod(mmi * ((a - 65) - key(2)), 26) + 65;
        result = strcat(result, char(a));
    end
end