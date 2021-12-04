%Takes in a game object and generates a list of psuedo-legal moves for the
%side that has the move. Moves are represented by a 1 by 4 row vector with
%the first 2 numbers stating which board square the piece starts on and the
%last 2 numbers stating which board square the piece is moving to. Castling
%isn't included here. 

function moveList = moveGeneration(game)
    moveList = zeros(300,4); %218 is the max legal moves possible for any position, but moveGen creates psuedo-legal moves
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
        for i = 1:size(indices,1)
            piece = game.Board(indices(i,1),indices(i,2))-8;
            if piece > 0 && piece < 7 %Required for when moveGeneration is called by isInCheck
                generator = functionMap(piece);
                pieceMoveList = generator(game, indices(i,:));
                if ~(isempty(pieceMoveList)) %line 25: add that pieces' move list to the full move list
                    moveList([moveCounter:moveCounter+size(pieceMoveList,1)-1],:) = pieceMoveList; %#ok<NBRAK>
                end
                moveCounter = moveCounter + size(pieceMoveList,1);
            end
        end
        
    else %black
        [rows,columns] = find(game.bpBit);
        indices = [rows columns];
        for i = 1:size(indices,1)
            piece = game.Board(indices(i,1),indices(i,2))-16;
            if piece > 0 && piece < 7 %Required for when moveGeneration is called by isInCheck
                generator = functionMap(piece);
                pieceMoveList = generator(game, indices(i,:));
                if ~(isempty(pieceMoveList)) %line 40: add that pieces' move list to the full move list
                    moveList([moveCounter:moveCounter+size(pieceMoveList,1)-1],:) = pieceMoveList; %#ok<NBRAK> 
                end               
                moveCounter = moveCounter + size(pieceMoveList,1);
            end
        end
    end
    for move = size(moveList,1):-1:1 %delete unused moves from preallocation
        if moveList(move,1) == 0
            moveList(move,:) = [];
        else
            break
        end
    end
end
