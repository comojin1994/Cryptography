function feature = Inv_Row_Shift(feature)
    for i =2:4
        feature(i,:) = circshift(feature(i, :), i - 1);
    end
end