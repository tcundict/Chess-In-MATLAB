function square = createEnPassant(square)
if square ~= '-'
    rank = str2double(square(2));
    file = square(1)-96;
    square = [rank file];
else
    square = [];
end
    