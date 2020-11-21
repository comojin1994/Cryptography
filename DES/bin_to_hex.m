function output = bin_to_hex(in)
    for i=0:((size(in,2)/8) -1)
        output(1,(1:2)+2*i) = dec2hex(bi2de(in(1,(1:8)+8*i),'left-msb'),2);
    end
end