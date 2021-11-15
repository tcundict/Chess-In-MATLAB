import importFEN.*
import PieceClass.*
import GameClass.*
clear

usrInput = input('Paste a valid FEN string with no whitespace at the end: ', 's');
game = importFEN(usrInput);
board = game.Board;
disp(rot90(fliplr(board), 2)) %Change format so that we are viewing the board from White's perspective
%rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBKQBNR/ w kqKQ - 0 0  ==  Starting position