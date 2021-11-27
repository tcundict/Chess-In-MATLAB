%captureEnPassant checks if a move was an en passant capture and then, if
%it was, deletes the pawn that was captured

function game = captureEnPassant(game, move, piece)
if ~game.Turn
    pieceType = piece-8;
else
    pieceType = piece-16;
end
if pieceType == 1 && isequal(move(3:4),game.EnPassant) %check if move was en passant capture
    if ~game.Turn
        game.Board(move(3)-1,move(4)) = 0;
    else
        game.Board(move(3)+1,move(4)) = 0;
    end
end
end

