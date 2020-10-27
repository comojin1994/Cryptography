function P = Vigenere_FreqAtt(C)
    Table = {'str', 'ind', 'diff', 'gcd of diff'};
    gcd_of_diff = Table(:, 4);
    t_Size = size(gcd_of_diff);
    gcd_of_diff_ = reshape(cell2mat(gcd_of_diff(2:t_Size(1))), 1, []);
    
    m = input('Enter Keyword length : ');
    keywords = cell(m,1);
    for i = 1:length(C)
        x = mod(i, m);
        if x == 0
            keywords(m) = strcat(keywords(m), C(i));
        else
            keywords(x) = strcat(keywords(x), C(i));
        end
    end
    
    K_Table = cell(m,1);f_Alpha = 5;
    for i = 1:m
        words = char(keywords(i)); wordsVec = [];
        for j = 1:length(words)
            wordsVec(j) = words(j);
        end
        table = tabulate(wordsVec);
        [wordsTable, order] = sort(table(65:length(table), 1:2), 'descend');
        orders = order(:, 2);
        t_list = [];
        for j = 1:length(orders)
            t_list(j) = mod(orders(j) - f_Alpha, 26) + 'A';
        end
        if length(t_list) < 26
            for j = length(t_list) + 1:26
                t_list(j) = mod(1 - f_Alpha, 26) + 'A';
            end
        end
        t_list = char(t_list);
        K_Table(i) = cellstr(t_list);
    end
    disp(K_Table);
    
    while 1
       t_list = [];
       input_word = input('Enter Keyword : ', 's');
       for i = 1:length(C)
           key = mod(i, m);
           if key == 0
               key = m;
           end
           t_list(i) = mod(C(i) - input_word(key), 26) + 'a';
       end
       P = char(t_list);
       fprintf("K = %s, \nP = %s\n", input_word, P);
       prompt = input('END ? : ', 's');
       if prompt == 'Y' || prompt == 'y'
           fprintf('Plain Text : %s\n', P);
           return;
       end
    end
    
end