function output = Inv_Column_Mix(feature)

    output=feature;
    for i = 1:4:13
        first = feature(i); second = feature(i + 1);
        third = feature(i + 2); fourth = feature(i + 3);
        
        output(i) = bitxor(bitxor(bitxor(xtime(first, 14), xtime(second, 11)), xtime(third, 13)), xtime(fourth, 9));
        output(i + 1) = bitxor(bitxor(bitxor(xtime(first, 9), xtime(second, 14)), xtime(third, 11)), xtime(fourth, 13));
        output(i + 2) = bitxor(bitxor(bitxor(xtime(first, 13), xtime(second, 9)), xtime(third, 14)), xtime(fourth, 11));
        output(i + 3) = bitxor(bitxor(bitxor(xtime(first, 11), xtime(second, 13)), xtime(third, 9)), xtime(fourth, 14));
    end
end