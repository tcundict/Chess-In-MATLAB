function moveList = pawnGen(game, origin)
if ~game.Turn %white
    moveList = [[origin origin+[1 0]];...
        [origin origin+[2 0]];...
        [origin origin+[1 -1]];...
        [origin origin+[1 1]]];
else %black
    moveList = [[origin origin+[-1 0]];...
        [origin origin+[-2 0]];...
        [origin origin+[-1 1]];...
        [origin origin+[-1 -1]]];
end
for move = 4:-1:1
    flag = false;
    for coordinate = 3:4
        if ~flag && moveList(move,coordinate) < 1 || moveList(move,coordinate) > 8
            moveList(move,:) = [];
            flag = true;
            break
        end
    end
    if flag %flag must go first or we risk attempting to index pBit with negative numbers
        continue
    end
    if ~game.Turn %white
        if (move == 3 || move == 4) ...      %checking the pawn's captures
                && ~game.bpBit(moveList(move, 3),moveList(move, 4)) %if there's no white piece on square, delete the capture
            moveList(move,:) = [];
            continue
        end
        if move == 2 && (origin(1) ~= 2) %white pawns must be on 2nd rank to move 2 squares
            moveList(move,:) = [];
            continue
        end
    else %black
        if (move == 3 || move == 4) ...
                && ~game.wpBit(moveList(move, 3),moveList(move, 4))
            moveList(move,:) = [];
            continue
        end
        if move == 2 && (origin(1) ~= 7) %black pawns must be on 7th rank to move 2 squares
            moveList(move,:) = [];
            continue
        end
    end
    if (move == 1 || move == 2) ...   %checking the pawn's regular moves
            && game.pBit(moveList(move, 3),moveList(move, 4)) %if square is blocked, delete the move
        moveList(move,:) = [];
        continue
    end
end
end
