
% Chess in MATLAB - The goal is to create Chess that is playable through
% the command line. A board will be shown in a figure to avoid trying to
% display the board with confusing Command Line representations.
choice = true;
disp(['Welcome to Chess In MATLAB, please read the README before playing'...
      ' and enjoy your game!'])
while choice 
choice = 0;
flag = 1;
close all
while flag
    game = strip(input([['Enter 1 to play a game from the starting position '] ...
        ['or input a valid FEN String: ']], 's')); %#ok<NBRAK>
    if game == '1'
        game = importFEN('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');
        flag = 0;
    else
        flag = 0;
        try
            game = importFEN(game); 
        catch ME
            if contains(ME.identifier, 'importFEN')
                disp([['Invalid FEN string. '] [ME.message]]) %#ok<NBRAK>
                fprintf('\n')
                flag = 1;
            else
                disp('Invalid FEN string. Please double check that your string has proper FEN notation.')
                fprintf('\n')
                flag = 1;
            end
        end
    end
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
while game.State == 0
    fprintf('\n')
    flag = 0;
    moveAccepted = 0;
    if ~game.Turn %white's turn
        disp('White to play:')
    else %black's turn
        disp('Black to play:')
    end
    while ~moveAccepted
        isLegal = false;
        [game, errorDisplayed, moveAccepted, flag, move] = getInput(game);
        if ~errorDisplayed %if valid notation/no command was entered
            for m = 1:size(game.moveList,1)
                if isequal(game.moveList(m,:),move)
                    isLegal = true;
                    break
                end
            end
            if isLegal
                moveAccepted = 1;
                game = checkForPromotion(game,move);
                game = game.makeMove(move); %Move has passed all tests, make the move
            else
                disp('Illegal move, please try again.')
            end
        end
    end %move input and validation
    if flag %if resigned or draw was accepted, don't look for checkmate
        break
    end
    game = game.createLegalMoves();
    game.State = game.isCheckmate();
    displayBoard(game)
    figureHandles = get(groot,'Children');
    if size(figureHandles,1) > 1 %Close past board figures
        close(figureHandles(2))
    end
end %Main game loop
if game.State == 1
    if ~game.Turn 
       disp('Game over, Black wins by checkmate!')
    else 
       disp('Game over, White wins by checkmate!')
    end
elseif game.State == 2
       disp('Game over. Draw by stalemate.')
elseif game.State == 3
       disp('Game over. Draw by 50-move rule.')
elseif game.State == 4
    %%%Saved for Threefold repetition
elseif game.State == 5
    disp('Game over. Draw by agreement.')
elseif game.State == 6
    if ~game.Turn
        disp('Game over, Black wins by resignation!')
    else
        disp('Game over, White wins by resignation!')
    end
end
while ~isempty(choice) && ~isequal('1',choice)
fprintf('\n')
choice = input('Hit enter to close Chess In MATLAB or enter 1 to play again: ','s');
end
end %Main program loop
disp('Thanks for playing!')
close all
        

    




