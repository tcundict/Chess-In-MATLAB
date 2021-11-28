%checkCastling checks if a move will invalidate further castling, in order
%to castle, it must be both the rook and the king's first move. If a
%previous move has moved one of these pieces, then that side will lose the
%ability to castle

function Castling = updateCastling(game,move,piece)
Castling = game.Castling;
origin = move(1:2);
if ~game.Turn %white 
    piece = piece-8;    
    if piece == 6 %white moving king
    Castling.wKingside = false;
    Castling.wQueenside = false;
    elseif piece == 4 && isequal(origin,[1 1]) %white moving queenside rook
        Castling.wQueenside = false;
    elseif piece == 4 && isequal(origin,[1 8]) %white moving kingside rook
        Castling.wKingside = false;
    end
else %black
   piece = piece-16;
    if piece == 6 % moving king
    Castling.bKingside = false;
    Castling.bQueenside = false;
    elseif piece == 4 && isequal(origin,[8 1]) %white moving queenside rook
        Castling.bQueenside = false;
    elseif piece == 4 && isequal(origin,[8 8]) %white moving kingside rook
        Castling.bKingside = false;
    end
end

