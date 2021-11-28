
% Chess in MATLAB - The goal is to create Chess that is playable through
% the command line. A board will be shown in a figure to avoid trying to
% display the board with confusing Command Line representations.
choice = true;
disp(['Welcome to Chess In MATLAB, please read the README before playing'...
      ' and enjoy your game!'])
while choice 
choice = 0;
close all
game = input([['Enter 1 to play a game from the starting position '] ...
                ['or input a valid FEN String: ']], 's'); %#ok<NBRAK>
if game == '1'
    game = importFEN('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');
else
    game = importFEN(game);
end
game = game.updateBoards(game.Board); %initialize relevant properties for game
game = game.createLegalMoves();
game.State = game.isCheckmate();
displayBoard(game)

%Game loop enters if checkmate has not happened.
%   Ask players to make moves while checkmate has not happened.
%       If no checkmate, ask the other side for a move
%When checkmate achieved, display a message and take an input to play
%another game or close Chess In MATLAB.
fileChars = {'a','b','c','d','e','f','g','h'};
rankChars = {'1','2','3','4','5','6','7','8'};
while game.State == 0
    if ~game.Turn %white's turn
        disp('White to play:')
        moveAccepted = 0;
        while ~moveAccepted
            errorDisplayed = false;
            isLegal = false;
            origin = input('Enter the starting square of the piece you want to move (e.g. e2): ', 's');
            tgtSquare = input('Enter the target square of the piece being moved (e.g. e4): ','s');
            if isequal(origin, 'O-O')
                if game.Castling.wKingside && sum(game.Board(1,6:7)) == 0 %Castling must be possible, and the squares between, empty
                    if ~(isInCheck(game, [1 5]) ||  isInCheck(game, [1 6])... 
                       || isInCheck(game, [1 7])) %Square cannot be checked
                        game = game.makeCastle('wKingside');
                        break
                    end
                end  
            elseif isequal(origin, 'O-O-O')
                if game.Castling.wQueenside && sum(game.Board(1,2:4)) == 0
                    if ~(isInCheck(game, [1 2]) ||  isInCheck(game, [1 3])...
                       || isInCheck(game, [1 4]) || isInCheck(game, [1 5]))
                        game = game.makeCastle('wQueenside');
                        break
                    end
                end 
            else
                move = [origin tgtSquare]; %if following the ex. then move == 'e2e4' right now
                characters  = num2cell(move);
                if ismember(characters{1}, fileChars) && ismember(characters{2}, rankChars) ...
                        && ismember(characters{3}, fileChars) && ismember(characters{4}, rankChars)...
                        && size(characters,2) == 4  %squares were valid, 2 squares given 
                    move = [str2double(characters{2}) characters{1}-96 ...
                            str2double(characters{4}) characters{3}-96];
                else
                    move = [];
                    disp('Invalid notation, please try again.')
                    errorDisplayed = true;
                end
            end
            if ~errorDisplayed
                for m = 1:size(game.moveList,1)
                    if isequal(game.moveList(m,:),move)
                        isLegal = true;
                        break
                    end
                end
                if isLegal
                    moveAccepted = 1;
                    if game.Board(move(1),move(2)) == 9 && move(3) == 8 %White pawn has reached the 8th rank
                        pieceStruct = struct('N', PieceClass.Knight,...
                                             'B', PieceClass.Bishop,...
                                             'R', PieceClass.Rook,  ...
                                             'Q', PieceClass.Queen);
                        validInput = 0;
                        while ~validInput
                        	promInput = input('Pawn Promotion! Please enter promoted piece type. See README for details.','s');
                            if ismember(promInput, {'N','B','R','Q'})
                                validInput = 1;
                                game.Promotion = pieceStruct.(promInput)+8;
                            end
                        end
                    end
                    game = game.makeMove(move); %Move has passed all tests, make the move
                else
                    disp('Illegal move, please try again.')
                end
            end
        end
        
        game = game.createLegalMoves(); 
        game.State = game.isCheckmate(); 
        displayBoard(game)
        figureHandles = get(groot,'Children');
        if size(figureHandles,1) > 1 %Close past board figures
            close(figureHandles(2))
        end
    else %black's turn
        disp('Black to play:')
        moveAccepted = 0;
        while ~moveAccepted
            errorDisplayed = false;
            isLegal = false;
            origin = input('Enter the starting square of the piece you want to move (e.g. e7): ', 's');
            tgtSquare = input('Enter the target square of the piece being moved (e.g. e5): ','s');
            if isequal(origin, 'O-O')
                if game.Castling.bKingside && sum(game.Board(8,6:7)) == 0 %Castling must be possible, and the squares between, empty
                    if ~(isInCheck(game, [8 5]) ||  isInCheck(game, [8 6])... 
                       || isInCheck(game, [8 7])) %Square cannot be checked
                        game = game.makeCastle('bKingside');
                        break
                    end
                end  
            elseif isequal(origin, 'O-O-O')
                if game.Castling.bQueenside && sum(game.Board(8,2:4)) == 0
                    if ~(isInCheck(game, [8 2]) ||  isInCheck(game, [8 3])...
                       || isInCheck(game, [8 4]) || isInCheck(game, [8 5]))
                        game = game.makeCastle('bQueenside');
                        break
                    end
                end 
            else
                move = [origin tgtSquare]; 
                characters  = num2cell(move);
                if ismember(characters{1}, fileChars) && ismember(characters{2}, rankChars) ...
                        && ismember(characters{3}, fileChars) && ismember(characters{4}, rankChars) %squares were inside the board
                    move = [str2double(characters{2}) characters{1}-96 ...
                            str2double(characters{4}) characters{3}-96];
                else
                    move = [];
                    disp('Invalid notation, please try again.')
                    errorDisplayed = true;
                end
            end
            if ~errorDisplayed
                for m = 1:size(game.moveList,1)
                    if isequal(game.moveList(m,:),move)
                        isLegal = true;
                        break
                    end
                end
                if isLegal
                    moveAccepted = 1;
                    if game.Board(move(1),move(2)) == 17 && move(3) == 1 %Black pawn has reached the 1st rank
                        pieceStruct = struct('N', PieceClass.Knight,...
                                             'B', PieceClass.Bishop,...
                                             'R', PieceClass.Rook,  ...
                                             'Q', PieceClass.Queen);
                        validInput = 0;
                        while ~validInput
                        	promInput = input('Pawn Promotion! Please enter promoted piece type. See README for details.','s');
                            if ismember(promInput, {'N','B','R','Q'})
                                validInput = 1;
                                game.Promotion = pieceStruct.(promInput)+16;
                            end
                        end
                    end
                    game = game.makeMove(move); %Move has passed all tests, make the move
                else
                    disp('Illegal move, please try again.')
                end
            end
            
        end
        
        game = game.createLegalMoves();
        game.State = game.isCheckmate();
        displayBoard(game)
        figureHandles = get(groot,'Children');
        if size(figureHandles,1) > 1 %Close past board figures
            close(figureHandles(2))
        end
    end
end
if game.State == 1
    if ~game.Turn %white's turn, cannot move, is in check
       disp('Game over, black wins by checkmate!')
    else %black's turn, cannot move, is in check
       disp('Game over, white wins by checkmate!')
    end
elseif game.State == 2
     if ~game.Turn %white's turn, cannot move, is not in check
       disp('Stalemate, white has no legal moves but is not in check!')
     else %black's turn, cannot move, is not in check
       disp('Stalemate, black has no legal moves but is not in check!')
     end
end
while ~isempty(choice) && ~isequal('1',choice)
choice = input('Hit enter to close Chess In MATLAB or enter 1 to play again: ','s');
end
end
disp('Thanks for playing!')
close all
        

    




