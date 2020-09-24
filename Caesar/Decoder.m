function output = Decoder(text, key)
  result = '';
  ascii = double(text);
  idx = 1;
  for a = ascii
    if a - key < 65
      result = strcat(result, char(a - key + 26));
    else
      result = strcat(result, char(a - key));
    end
    idx += 1;
  end
  fprintf('Key : %d, Result : %s\n', key, result);
  output = result;
end
