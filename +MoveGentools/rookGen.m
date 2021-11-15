function moveList = rookGen(game, rsquare)
moveList = zeros(14,4);
directionMap = containers.Map({1 2 3 4}, {[0 -1], [0 1], [-1 0], [1 0]});
count = 1;
for direction = 1:4
    tgtSquare = rsquare;
    tgtSquare = tgtSquare + directionMap(direction);
    flag = false;
    while ~flag ...
            && tgtSquare(1) < 9 && tgtSquare(1) > 0 ...
            && tgtSquare(2) < 9 && tgtSquare(2) > 0
        moveList(count, :) = [rsquare tgtSquare];
        count = count + 1;
        if game.pBit(tgtSquare(1),tgtSquare(2)) %rook hits a piece
            flag = true; %raise flag
            if game.Turn == wpBit(tgtSquare(1),tgtSquare(2)) %if same colour
                count = count - 1; %revert count
                moveList(count, :) = []; %delete the move
            end
        end
        tgtSquare = tgtSquare + directionMap(direction);
    end
end
sizeOfMoves = size(moveList);
for move = sizeOfMoves(1):-1:1 %delete unused moves from preallocation
    if moveList(move,1) == 0
        moveList(move,:) = [];
    else
        break
    end
end
end
