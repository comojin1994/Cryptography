function output = Column_Mix(feature)

    output = feature;
    for i = 1:4:13
        first = feature(i); second = feature(i + 1);
        third = feature(i + 2); fourth = feature(i + 3);
        
        output(i) = bitxor(bitxor(bitxor(xtime(first, 2), xtime(second, 3)), third), fourth);
        output(i + 1) = bitxor(bitxor(bitxor(xtime(second, 2), xtime(third,3)), first), fourth);
        output(i + 2) = bitxor(bitxor(bitxor(xtime(third, 2), xtime(fourth,3)), first), second);
        output(i + 3) = bitxor(bitxor(bitxor(xtime(fourth, 2), xtime(first,3)), second), third);
    end
end