%Checks to see if a move will result in a pawn being promoted, and if so,
%sets game.Promotion to the correct piece based on user input.

function game = checkForPromotion(game,move)
import PieceClass.*
if ~game.Turn
    backRank = 8;
    colourNum = PieceClass.White;
else
    backRank = 1;
    colourNum = PieceClass.Black;
end
if game.Board(move(1),move(2)) == PieceClass.Pawn+colourNum && move(3) == backRank %Pawn has reached the end of the board
    pieceStruct = struct('N', PieceClass.Knight,...
        'B', PieceClass.Bishop,...
        'R', PieceClass.Rook,  ...
        'Q', PieceClass.Queen,...
        'n', PieceClass.Knight,...
        'b', PieceClass.Bishop,...
        'r', PieceClass.Rook,  ...
        'q', PieceClass.Queen);
    validInput = 0;
    while ~validInput
        promInput = strip(input('Pawn Promotion! Please enter promoted piece type. (N, B, R, Q): ','s'));
        if ismember(promInput, {'N','B','R','Q','n','b','r','q'})
            validInput = 1;
            game.Promotion = pieceStruct.(promInput)+colourNum;
        end
    end
end

                    