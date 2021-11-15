
%Function that takes a Game object and a square with a knight on it as an
%argument, and outputs a list of moves for that knight.

function moveList = knightGen(game, ksquare)
moveList = [[ksquare,[ksquare(1)-1,ksquare(2)-2]]
             [ksquare,[ksquare(1)+1,ksquare(2)-2]]
             [ksquare,[ksquare(1)-1,ksquare(2)+2]]
             [ksquare,[ksquare(1)+1,ksquare(2)+2]]
             [ksquare,[ksquare(1)-2,ksquare(2)-1]]
             [ksquare,[ksquare(1)-2,ksquare(2)+1]]
             [ksquare,[ksquare(1)+2,ksquare(2)-1]]
             [ksquare,[ksquare(1)+2,ksquare(2)+1]]
             ];

%Loop through moves and delete moves that would put the knight outside the
%board (coordinates smaller than 0 or bigger than 8) or that would
%land on a piece of the same colour
for move = 8:-1:1 %iterate through moves backwards to avoid errors when deleting
    tgtSquare = [moveList(move,3) moveList(move,4)];
    flag = true;
    for coordinate = 1:2
        if tgtSquare(coordinate) < 1 || tgtSquare(coordinate) > 8 %outside board
            moveList(move,:) = []; 
            flag = false; %don't check for same piece colour, go to next move
            break
        end
    end
    if flag... %flag must go first or we risk attempting to index board with negative numbers
       && game.pBit(tgtSquare(1),tgtSquare(2)) ... %target square isn't empty
       && (game.Turn == game.wpBit(tgtSquare(1),tgtSquare(2))) %same colour
       moveList(move,:) = [];
    end
end
end