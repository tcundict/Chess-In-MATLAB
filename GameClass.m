classdef GameClass < handle
    properties
    Board = zeros(8,8);
    Turn                            %0 = white, 1 = black
    Castling
    EnPassant
    HalfMove
    FullMove
%     pBit = (obj.Board ~= 0);
%     wpBit = obj.pBit == (obj.Board < 16);
%     bpBit = obj.pBit == (obj.Board > 16);
    end
end
        