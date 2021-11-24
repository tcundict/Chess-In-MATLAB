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
        function game = updateState(game,newBoard)
            game.Board = newBoard;
            game.pBit = game.Board ~= 0;
            game.wpBit = (game.pBit == (game.Board < 16));
            game.bpBit = game.Board > 16;   
            game.moveList = moveGeneration(game);
        end
    end
end
