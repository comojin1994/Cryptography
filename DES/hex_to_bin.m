function output = hex_to_bin(in)
    for i=0:((size(in,2)/2) -1)
        output(1,(1:8)+8*i) = de2bi(hex2dec(in(1,(1:2)+2*i)),8,'left-msb');
    end
end