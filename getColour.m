
function bitFive = getColour(num)
num = uint8(num);
bitFive = bitand(num, 0b10000);  %check what bit is in 5th position
bitFive = bitshift(bitFive, -4); %pull bitFive to the first position