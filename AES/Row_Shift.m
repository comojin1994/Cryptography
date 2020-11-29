function feature = Row_Shift(feature)
    for i = 2:4
        feature(i,:) = circshift(feature(i, :), 1 - i);
    end
end