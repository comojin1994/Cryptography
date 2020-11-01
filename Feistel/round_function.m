function output = round_function(R, key)
    c1 = double(xor(str2double(R(1)), str2double(key(1))));
    c0 = double(xor(xor(str2double(R(2)), str2double(key(2))), str2double(key(3))));
    output = strcat(string(c1), string(c0));
end