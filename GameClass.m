%GameClass is the central class around which Chess In MATLAB is built. Game
%objects store all of the important data that is needed to model Chess
%within the program. It has several methods that are integral to playing
%the game (e.g. makeMove, isCheckmate).

classdef GameClass
    properties
        Board = zeros(8,8);             %indexed with (rank, file) a=1, h=8
        Turn                            %0 = white, 1 = black
        Castling                        %1x4 struct
        EnPassant                       %1x2 row vector, denotes a square
        HalfMove                        %counts half-moves for 50 move rule
        FullMove                        %number of turns so far
        State = 0                       %current state of game, see end of ChessInMATLAB for options
        Promotion                       %Piece being promoted to, uses PieceClass
        wpList                          %white piece list
        bpList                          %black piece list
        pBit                            %bitboard of pieces (logical 8x8)
        wpBit                           %bitboard of white pieces (logical 8x8)
        bpBit                           %bitboard of black pieces (logical 8x8)
        moveList                        %n x 4 matrix, each row is a move, see moveGeneration for more
    end
    methods     
       
        %updateBoards takes a new board, sets the game's board equal to
        %that, then updates all the bitboards based on the new board. A
        %bitboard is essentially a logical matrix with the same dimensions
        %of the board that stores data on a certain topic. wpBit for
        %example is true in every position on the board where there is a
        %white piece. For more info on bit boards visit:
        %https://en.wikipedia.org/wiki/Bitboard
        function game = updateBoards(game,newBoard)
            game.Board = newBoard;
            game.pBit = game.Board ~= 0;
            game.wpBit = (game.pBit == (game.Board < 16));
            game.bpBit = game.Board > 16;
        end
        
        %makeMove takes a move (1x4 row vector), effectuates it,
        %and then updates the following: fullmove, halfmove, en passant
        %square, castling rights, bitboards, and who's turn it is.
        function game = makeMove(game,move)
            piece = game.Board(move(1),move(2));
            
            %fullmove
            if game.Turn %black moved
                game.FullMove = game.FullMove + 1;
            end
            
            %halfmove
            if game.pBit(move(3),move(4)) %move is a capture
                game.HalfMove = 0;
            elseif (~game.Turn && piece-8 == 1) || (game.Turn && piece-16 == 1) %pawn moved
                game.HalfMove = 0;
            else
                game.HalfMove = game.HalfMove + 1;
            end
            
            game = captureEnPassant(game,move,piece); %does the capture if move is en passant
            game.Board(move(1),move(2)) = 0;    %remove piece from old square
            if isempty(game.Promotion)
                game.Board(move(3),move(4)) = piece; %place piece on new square
            else
                game.Board(move(3),move(4)) = game.Promotion; %Promote to new piece
                game.Promotion = [];
            end
            game.EnPassant = updateEnPassant(game,move,piece); 
            game.Castling = updateCastling(game,move,piece);
            
            game = game.updateBoards(game.Board);
            game.Turn = ~game.Turn; %Change turns
        end
        
        %Effecuates a castle, should only be called once the castle has
        %been determined to be legal. Updates the same properties as
        %makeMove.
        function game = makeCastle(game, castleString)
            if isequal(castleString, 'wKingside')
                game.FullMove = game.FullMove + 1;
                game.HalfMove = game.HalfMove + 1;
                game.Board(1,5) = 0;
                game.Board(1,8) = 0;
                game.Board(1,7) = 14;
                game.Board(1,6) = 12;
                game.EnPassant = [];
                game.Promotion = [];
                game.Castling.wKingside = false;
                game.Castling.wQueenside = false;
                game = game.updateBoards(game.Board);
                game.Turn = ~game.Turn;
            elseif isequal(castleString, 'wQueenside')
                game.FullMove = game.FullMove + 1;
                game.HalfMove = game.HalfMove + 1;
                game.Board(1,5) = 0;
                game.Board(1,1) = 0;
                game.Board(1,3) = 14;
                game.Board(1,4) = 12;
                game.EnPassant = [];
                game.Promotion = [];
                game.Castling.wKingside = false;
                game.Castling.wQueenside = false;
                game = game.updateBoards(game.Board);
                game.Turn = ~game.Turn;
            elseif isequal(castleString, 'bKingside')
                game.FullMove = game.FullMove + 1;
                game.HalfMove = game.HalfMove + 1;
                game.Board(8,5) = 0;
                game.Board(8,8) = 0;
                game.Board(8,7) = 22;
                game.Board(8,6) = 20;
                game.EnPassant = [];
                game.Promotion = [];
                game.Castling.wKingside = false;
                game.Castling.wQueenside = false;
                game = game.updateBoards(game.Board);
                game.Turn = ~game.Turn;
            elseif isequal(castleString, 'bQueenside')
                game.FullMove = game.FullMove + 1;
                game.HalfMove = game.HalfMove + 1;
                game.Board(8,5) = 0;
                game.Board(8,1) = 0;
                game.Board(8,3) = 22;
                game.Board(8,4) = 20;
                game.EnPassant = [];
                game.Promotion = [];
                game.Castling.wKingside = false;
                game.Castling.wQueenside = false;
                game = game.updateBoards(game.Board);
                game.Turn = ~game.Turn;
            else
                disp('Castling failed, internal error. Please contact developer.') %Should never appear (hopefully!)
            end
        end
        
        %Creates a list of actual legal moves that can be played, does not
        %include castling, that is taken care of in Chess In MATLAB.m after
        %the user has inputed a move to play.
        function game = createLegalMoves(game)
            game.moveList = moveGeneration(game);
            game.moveList = filterForChecks(game);
        end
        
        %Looks at the game board and determines if it is checkmate,
        %stalemate, or neither.
        function state = isCheckmate(game)
            %returns: 0 if nothing
            %         1 if checkmate
            %         2 if stalemate
            game = game.createLegalMoves;
            if isempty(game.moveList)
                if isInCheck(game)
                    state = 1;
                else
                    state = 2;
                end
            elseif game.HalfMove >= 100
                state = 3; %50 move rule
            else
                state = 0;
            end
        end
    end
end
