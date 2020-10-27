function Kasiski(C)
    Table = {'str', 'ind', 'diff', 'gcd of diff'};
    for i = 1:length(C) - 2
        word = C(i:i+2); ind_list = (i); cnt = 1;
        for j = i + 1:length(C) - 2
            if word ==  C(j:j+2)
                cnt = cnt + 1;
                ind_list(cnt) = j;
            end
        end
        
        if cnt >= 2
            different = []; index = 1;
            for i = 1:length(ind_list)
                num = ind_list(i);
                for j = i + 1:length(ind_list)
                    different(index) = ind_list(j) - num;
                end
            end
            gcd_of_diff = 0;
            if length(different) == 1
                gcd_of_diff = different(1);
            else
               gcd_of_diff = gcd(sym(different)); 
            end
            row = {word, ind_list, different, gcd_of_diff};
            Table = [Table; row];
        end
    end
    display(Table);
end