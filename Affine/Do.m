function Do()
    key = [7 2];
    encode_text = 'hello';
    decode_text = 'ZEBBW';
    
    fprintf('%s encoded to %s\n', encode_text, Encoder(encode_text, key));
    fprintf('%s decoded to %s\n', decode_text, Decoder(decode_text, key));
end