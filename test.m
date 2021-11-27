import importFEN.*
import PieceClass.*
import GameClass.*
clear

game = input([['Enter 1 to play a game from the starting position '] ...
                ['or input a valid FEN String: ']], 's'); %#ok<NBRAK>
if game == '1'
    game = importFEN('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');
else
    game = importFEN(game);
end
game = game.updateBoards(game.Board);
game = game.createLegalMoves();
disp(game.moveList);
displayBoard(game)
%rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBKQBNR/ w kqKQ - 0 0  ==  Starting position