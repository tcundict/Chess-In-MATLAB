%Takes in a game and returns whether or not the player who has the move is
%in check. The goal is to use it for determining checkmate and getting rid
%of illegal moves (pins). Can accept 1 or 2 arguments, if only 1 given,
%then the square being checked is the king square. If 2nd argument give,
%then isInCheck checks to see if that square is attacked.

function check = isInCheck(game,square)
game.Turn = ~game.Turn; %Switch whos turn it is to generate which squares are being attacked
attackingMoveList = moveGeneration(game);
game.Turn = ~game.Turn;
if nargin == 1
    if ~game.Turn %white
        [tgtSquare(1), tgtSquare(2)] = find(game.Board==14);
    else %black
        [tgtSquare(1), tgtSquare(2)] = find(game.Board==22);
    end
elseif nargin == 2
    tgtSquare = square;
end
check = 0;

for move = 1:size(attackingMoveList,1)
    if isequal(attackingMoveList(move, [3 4]), tgtSquare)
        check = 1;
        break
    end
end