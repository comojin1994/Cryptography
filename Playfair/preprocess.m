function sentence = preprocess(P)
    sentence = (P(1));
    past = P(1);
    idx = 2;
    for p = P(2:strlength(P))
        if past == p
           sentence(idx) = 'x';
           idx = idx + 1;
        end
        
        sentence(idx) = p;
        idx = idx + 1;
        past = p;
    end
end