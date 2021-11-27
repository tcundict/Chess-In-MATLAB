classdef GameClass
    properties
        Board = zeros(8,8);
        Turn                            %0 = white, 1 = black
        Castling                        %1x4 cell array
        EnPassant                       %%%TODO%%%
        HalfMove                        %one double
        FullMove                        %one double
        Victory  = 0                    %0 = continuing, 1 = game is over
        wpList                          %white piece list
        bpList                          %black piece list
        pBit                            %bitboard of pieces
        wpBit                           %bitboard of white pieces
        bpBit                           %bitboard of black pieces
        moveList
    end
    methods
        %           Currently missing:
        %               Checkmate
        %               En Passant
        %               Draws
        %               Castling ability
        %               probably more, can't think of any rn          
        function game = updateBoards(game,newBoard)
            game.Board = newBoard;
            game.pBit = game.Board ~= 0;
            game.wpBit = (game.pBit == (game.Board < 16));
            game.bpBit = game.Board > 16;   
        end 
        function game = makeMove(game,move)
            piece = game.Board(move(1),move(2));
            game.Board(move(1),move(2)) = 0;
            game.Board(move(3),move(4)) = piece;
            game = updateBoards(game,game.Board);
            game.Turn = ~game.Turn; %Change turns
        end
        function game = createLegalMoves(game)
            game.moveList = moveGeneration(game);
            game.moveList = filterForChecks(game);
        end
    end
end
