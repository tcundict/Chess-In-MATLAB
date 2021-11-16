%Function that takes 4 arguments: a GameClass object,
%a set of directional vectors for a sliding piece (rook, bishop, or queen), 
%the maximum number of moves they can theoretically make, 
%and the square they start on as input arguments. 
%It returns all the possible moves that piece can make in that position as
%an n-by-4 array, where n is the amount of moves. Moves are stored as
%outlined in the moveGeneration function %%%TODO%%%.

function moveList = slidingGen(game, vectors, maxMoves, origin)
moveList = zeros(maxMoves,4);
directionMap = containers.Map(1:length(vectors), vectors);
count = 1;
for direction = 1:length(vectors)
    tgtSquare = origin;
    tgtSquare = tgtSquare + directionMap(direction);
    flag = false;
    while ~flag ...
            && tgtSquare(1) < 9 && tgtSquare(1) > 0 ...
            && tgtSquare(2) < 9 && tgtSquare(2) > 0
        moveList(count, :) = [origin tgtSquare];
        count = count + 1;
        if game.pBit(tgtSquare(1),tgtSquare(2)) %piece has run into a piece
            flag = true; %raise flag
            if game.Turn == getColour(game.Board(tgtSquare)) %same colour
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