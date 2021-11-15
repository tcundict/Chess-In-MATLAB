function board = createBoard(FENboard) 
FENboard = char(FENboard); %Convert to string for indexing
board = zeros(8,8); %Pre-allocate board representation
pieceMap = containers.Map({'p','n','b','r','q','k'},...
                          [PieceClass.Pawn, PieceClass.Knight,...
                          PieceClass.Bishop, PieceClass.Rook,...
                          PieceClass.Queen,PieceClass.King]);


% Note that the when printing the board to the screen it will be from
% Black's POV and will also be flipped horizontally. This is because
% rank 1, file 1 is in the top left of a MATLAB matrix as opposed to the
% top right where it typically is when playing as Black. 
rank = 8;
file = 1;
for i = 1:strlength(FENboard)
    if FENboard(i) == '/' % '/' separates the ranks in FEN
        rank = rank-1;
        file = 1;
    elseif ~isnan(str2double(FENboard(i))) %Blank squares
        file = file + str2double(FENboard(i)); 
    elseif ischar(FENboard(i)) %There is a piece on this square
        if isstrprop(FENboard(i), 'upper')
            board(rank,file) = PieceClass.White; 
        else
            board(rank,file) = PieceClass.Black;
        end
        
        %Add the number for piece type to the number for piece colour
        board(rank,file) = board(rank,file) + pieceMap(lower(FENboard(i)));
        file = file + 1;
    else
        error = MException('importFEN:InvalidPiecePlacement',...
        ['A character in the piece placement string is invalid. '...
        'A piece placement string can only contain /, 1-8, pkbrqk']);
    throw(error)
    end 
end
end


