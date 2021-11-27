% Creates a base Piece Class that holds constant data for how the pieces are
% represented in the program. Pieces are represented numerically by the sum
% of their type and colour.


classdef PieceClass
    properties (Constant)
        Empty  = 0
        Pawn   = 1 
        Knight = 2
        Bishop = 3
        Rook   = 4
        Queen  = 5
        King   = 6
        
        White = 8
        Black = 16
    end
end


