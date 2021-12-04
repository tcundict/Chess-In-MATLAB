% A function that takes 1 argument of type 'char' and returns a Game object
% that contains all the relevant data encoded in the FEN string.
% For more information on FEN strings visit:
% https://www.chess.com/terms/fen-chess

function game = importFEN(FENstring)
import PieceClass.*
import GameClass.*
import FENtools.*;

game = GameClass;

%Some error handling
if isa(FENstring, 'char') ~= true
    error = MException('importFEN:WrongInputType',...
        'Input must be of type: char');
    throw(error)
end
FENstring = split(FENstring, ' ');
if length(FENstring) ~= 6
    error = MException('importFEN:InvalidFEN',...
        'FEN string must have 6 parts separated by singular whitespace');
    throw(error)
elseif isnan(str2double(FENstring{5}))
    error = MException('importFEN:InvalidHalfMove',...
        'Half move must be a numeric value');
    throw(error)
elseif isnan(str2double(FENstring{6}))
    error = MException('importFEN:InvalidFullMove',...
        'Full move must be a numeric value');
    throw(error)
end

game.Board = FENtools.createBoard(FENstring(1));
game.Turn = FENtools.createTurn(FENstring(2));
game.Castling = FENtools.createCastling(FENstring(3));
game.EnPassant = FENtools.createEnPassant(FENstring{4});
game.HalfMove = str2double(FENstring(5));
game.FullMove = str2double(FENstring(6));
end