function output = xtime(x, n)
    output = 0;
    
    if bitget(x, 1)
        output = n;
    end
    
    x = bitshift(x, -1);
    
    while x > 0
        n = bitshift(n, 1);
        
        if bitget(n, 9)
            n = bitxor(bitset(n, 9, 0), 27);
        end
        
        if bitget(x, 1)
            output = bitxor(output, n);
        end
        
        x = bitshift(x, -1);
    end
end    