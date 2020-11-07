function output = LFSR(c, s)
    seq = '';
    for ii = 1:2*(2^strlength(s) - 1)
        seq = strcat(seq, s(strlength(s)));

        cal_list = [];
        i = 1;
        for idx = 1:strlength(c)
            if (c(idx) == '1')
                cal_list(i) = str2double(s(idx));
                i = i + 1;
            end
        end
        
        result = cal_list(1);
        cal_list(1) = [];
        for element = cal_list
            result = xor(result, element);
        end
        result = num2str(double(result));

        s = strcat(result, s(1:strlength(s)-1));
    end
    
    output = '';
    cnt = count(seq, seq(1:strlength(c)));
    for idx = strlength(c):2^strlength(c) - 1
        temp = count(seq, seq(1:idx));
        if (cnt == temp) && (strlength(output) < strlength(seq(1:idx)))
            output = seq(1:idx);
        end
    end
end