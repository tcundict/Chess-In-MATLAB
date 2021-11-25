% Chess in MATLAB - The goal is to create Chess that is playable through
% the command line. A board will be shown in a figure to avoid trying to
% display the board with confusing Command Line representations.

import importFEN.*
import PieceClass.*
game = input([['Enter 1 to play a game from the starting position '] ...
                ['or input a valid FEN String: ']], 's'); %#ok<NBRAK>
if game == '1'
    game = importFEN('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');
else
    game = importFEN(game);
end
game = game.updateState(game.Board); %initialize relevant properties for game

%Game loop enters if checkmate has not happened.
%   Ask players to make moves while checkmate has not happened.
%       After a move:
%           Update boards
%           Generate legal moves
%           Check for checkmate
%           Display board in figure
%       If no checkmate, ask the other side for a move
%When checkmate achieved, display a message and take an input to play
%another game or close Chess In MATLAB.
    




