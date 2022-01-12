function [game, moveAccepted] = queenCastle(game)
if ~game.Turn
    if game.Castling.wQueenside && sum(game.Board(1,2:4)) == 0
        if ~(isInCheck(game, [1 2]) ||  isInCheck(game, [1 3])...
                || isInCheck(game, [1 4]) || isInCheck(game, [1 5]))
            game = game.makeCastle('wQueenside');
            moveAccepted = true;
        end
        
    end
else
    if game.Castling.bQueenside && sum(game.Board(8,2:4)) == 0
        if ~(isInCheck(game, [8 2]) ||  isInCheck(game, [8 3])...
                || isInCheck(game, [8 4]) || isInCheck(game, [8 5]))
            game = game.makeCastle('bQueenside');
            moveAccepted = true;
        end
    end
end