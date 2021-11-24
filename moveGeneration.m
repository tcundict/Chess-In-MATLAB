%Takes in a game object and generates a list of almost all legal moves for the
%side that has the move. Moves are represented by a 1 by 4 row vector with
%the first 2 numbers stating which board square the piece starts on and the
%last 2 numbers stating which board square the piece is moving to. Castling
%isn't included here. 

function moveList = moveGeneration(game)
    moveList = zeros(30,4); %218 is the max legal moves possible for any position
    moveCounter = 1;
    functionMap = containers.Map([1 2 3 4 5 6], {@MoveGentools.pawnGen,...
                                                 @MoveGentools.knightGen,...
                                                 @MoveGentools.bishopGen,...
                                                 @MoveGentools.rookGen,...
                                                 @MoveGentools.queenGen,...
                                                 @MoveGentools.kingGen});
    if ~game.Turn %white
        [rows,columns] = find(game.wpBit);
        indices = [rows columns];
        for i = 1:length(indices)
            piece = game.Board(indices(i,1),indices(i,2))-8;
            generator = functionMap(piece);
            pieceMoveList = generator(game, indices(i,:));
            if ~(isempty(pieceMoveList))
                moveList([moveCounter:moveCounter+size(pieceMoveList,1)-1],:) = pieceMoveList; %#ok<NBRAK>
            end
            moveCounter = moveCounter + size(pieceMoveList,1);
        end
        
    else %black
        [rows,columns] = find(game.wbBit);
        indices = [rows columns];
        for i = 1:length(indices)
            piece = game.Board(indices(i,1),indices(i,2))-16;
            generator = functionMap(piece);
            pieceMoveList = generator(game, indices(i,:));
            if ~(isempty(pieceMoveList))
                moveList([moveCounter:moveCounter+size(pieceMoveList,1)],:) = pieceMoveList; %#ok<NBRAK>
            end
            moveCounter = moveCounter + size(pieceMoveList,1);
        end
    end
end
