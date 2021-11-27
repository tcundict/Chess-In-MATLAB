%Takes in a game and returns whether or not the player who has the move is
%in check. The goal is to use it for determining checkmate and getting rid
%of illegal moves (pins).

function check = isInCheck(game)
game.Turn = ~game.Turn; %Switch whos turn it is to generate which squares are being attacked
attackingMoveList = moveGeneration(game);
game.Turn = ~game.Turn;
if ~game.Turn %white
    [kingSquare(1), kingSquare(2)] = find(game.Board==14);
else %black
    [kingSquare(1), kingSquare(2)] = find(game.Board==22);
end
check = 0;
for move = 1:size(attackingMoveList,1)
    if attackingMoveList(move, [3 4]) == kingSquare
        check = 1;
        break
    end
end