function result = Encoder(text, key)
    result = '';
    ascii = double(text);
    for a = ascii
        a = mod(key(1) * (a - 97) + key(2), 26) + 97;
        result = strcat(result, char(a));
    end
end