function [game,moveAccepted] = kingCastle(game)
if ~game.Turn
    if game.Castling.wKingside && sum(game.Board(1,6:7)) == 0 %Castling must be possible, and the squares between, empty
        if ~(isInCheck(game, [1 5]) ||  isInCheck(game, [1 6])...
                || isInCheck(game, [1 7])) %Square cannot be checked
            game = game.makeCastle('wKingside');
            moveAccepted = true;
        else
            disp('Could not castle!')
        end
        
    end
else
    if game.Castling.bKingside && sum(game.Board(8,6:7)) == 0 %Castling must be possible, and the squares between, empty
        if ~(isInCheck(game, [8 5]) ||  isInCheck(game, [8 6])...
                || isInCheck(game, [8 7])) %Square cannot be checked
            game = game.makeCastle('bKingside');
            moveAccepted = true;
        else
            disp('Could not castle!')
        end
    end
end