%takes a numerical representation of a piece and gets the colour of the
%piece by looking at its 5th bit, which represents colour
%0 = white, 1 = black
function bitFive = getColour(num)
num = uint8(num);
bitFive = bitand(num, 0b10000);  %check what bit is in 5th position
bitFive = bitshift(bitFive, -4); %extract the 5th bit