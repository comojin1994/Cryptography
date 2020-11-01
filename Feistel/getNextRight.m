function output = getNextRight(L, f)
    f = char(f);
    r1 = double(xor(str2double(L(1)), str2double(f(1))));
    r2 = double(xor(str2double(L(2)), str2double(f(2))));
    output = strcat(string(r1), string(r2));
end