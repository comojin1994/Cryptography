function output = StatisticalAttack(text)
  alpha = zeros(1, 26);
  for t = text
    alpha(double(t)-64) += 1;
  end
  key_Set = ['E', 'T', 'A', 'O' , 'I'];
  for k = key_Set
    key = char(find(alpha == max(alpha)) + 64) - double(k);
    if key < 0
      key += 26;
    end
    Decoder(text, key);
  end
end
