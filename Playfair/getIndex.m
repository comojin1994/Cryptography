function [x1,y1,x2,y2] = getIndex(K_table, P, i)
    temp1 = find(K_table == P(i) - 32);
    y1 = floor(temp1 / 5) + 1;
    x1 = mod(temp1, 5);
    if x1 == 0
        x1 = 5;
    end
        
    temp2 = find(K_table == P(i+1) - 32);
    y2 = floor(temp2 / 5) + 1;
    x2 = mod(temp2, 5);
    if x2 == 0
        x2 = 5;
    end
end