%determingEnPassant determines whether or not a move creates a valid
%enPassant square. If a pawn ever moves 2 squares then the square
%immediately behind it is a valid space for opposing pawns to capture on.

function enPassant = updateEnPassant(game,move,piece)
            if ~game.Turn && (piece-8 == 1) && (move(1)==2) && (move(3) == 4) %white pawn moved 2 squares
                enPassant = [move(1)+1 move(2)];
            elseif game.Turn && (piece-16 == 1) && (move(1)==7) && (move(3) == 5) %black pawn moved 2 squares
                enPassant = [move(1)-1 move(2)];
            else
                enPassant = [];
            end
end