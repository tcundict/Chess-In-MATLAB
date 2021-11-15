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
        Invalid = 7
        
        White = 8
        Black = 16
    end
    properties
    end
    methods
%         % Class constructor
%         function obj = PieceClass(type, colour)
%             if nargin == 2
%                 obj.type = type;
%                 obj.colour = colour;
%             else
%                 error = MException('PieceClass:InvalidInput',...
%                     'Incorrect number of input arguments, type and colour needed.');
%                 throw(error)
%             end
%         end
        
    end
end


