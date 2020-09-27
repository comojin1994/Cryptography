function output = ModMulInv(a, m)
    [g, c, ~] = gcd(a,m);
    output = mod(c, m);
end