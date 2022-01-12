# Chess-In-MATLAB

## About
Chess In MATLAB is a program that allows two people to play chess in the MATLAB environment.
Moves are entered through the Command Window and the board is displayed in a Figure. Chess In MATLAB 
is written entirely in MATLAB, but needs the Image Processing Toolbox in order to display the board properly.

## Features

- Players can resign and offer draws
- Pieces obey all the rules of the game, including pins, en passant and promotions
- A clear representation of the current board is shown in a MATLAB figure
- Supports the importing of FEN strings, allowing any position to be loaded



## Installation And Running It

*Make sure you have the Image Processsing Toolbox installed.*

Download and unzip Chess-In-MATLAB to a folder.
Open MATLAB and add that folder to your MATLAB Path or navigate to that folder in MATLAB.
In the Editor, run ChessInMATLAB.m or type ChessInMATLAB into the Command Window.

## Playing the Game
Upon startup, Chess-In-MATLAB will ask if you want to play
a game from the starting position or import your own position.
``` 
Welcome to Chess In MATLAB, please read the README before playing and enjoy your game!
Enter 1 to play a game from the starting position or input a valid FEN String: 
```
Press 1 to play a normal game, or copy in a FEN string.

After choosing how to start your game, Chess In MATLAB will alternate between asking White and Black for moves.

To move a piece, enter the square that the piece is currently sitting on and press Enter.

Then enter the square that you would like to move it to and press Enter.

If the move is accepted, the board should update and the move will be passed to the opposing side.

Otherwise, the move will fail and you will be asked for input again.

When entering a square, specify the file (column) and then the rank (row).

Example:
```
White to play:
Staring square of piece or a command: e2
Target square of piece: e4
```
All standard moves are entered this way except for Castling which is treated as a special Command. (see below)
Moves will continued to be asked for until one of the following is reached:
 - Checkmate/Stalemate
 - A draw is agreed upon
 - Draw by 50-move rule
 - One player resigns

Currently, 3-fold repetition is not supported and must be done manually using the draw command.
Once the game ends, a message denoting the end condition will print and the user will be asked if they would like to play again, or quit.
## Commands
Instead of entering a move, Chess In MATLAB supports several commands that would typically be available during a game of Chess.
To use a command, enter it into the first input on your turn.
| Command | Result |
| ------ | ------ |
| "resign" or "r" | Admits defeat for the active colour after a confirmation |
| "draw" or "d" | Offers a draw to the opposing colour |
| "O-O" | Try to castle kingside (use capital Os, not zeros) |
| "O-O-O" | Try to castle queenside (use capital Os, not zeros) |

Example:
```
White to play:
Staring square of piece or a command: resign
Are you sure you want to resign? (y/yes, n/no): yes
Game over, Black wins by resignation!
```
## Acknowledgements
Piece images were taken from [Wikimedia](https://commons.wikimedia.org/wiki/Category:SVG_chess_pieces) and were created by [Colin M.L. Burnett](https://en.wikipedia.org/wiki/User:Cburnett)

Images used under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/)

Board image created by me, Tom Cundict, in GIMP.
