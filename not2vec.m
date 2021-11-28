function move = not2vec(game, move)
    pieceStruct = struct('N', PieceClass.Knight,...
                         'B', PieceClass.Bishop,...
                         'R', PieceClass.Rook,  ...
                         'Q', PieceClass.Queen, ...
                         'K', PieceClass.King);
    approvedChars = {'N','B','R','Q','K','a','b','c','d','e','f','g','h',...
                     '1','2','3','4','5','6','7','8','x','=','O','-'};
    pieceChars = {'N','B','R','Q','K'};
    fileChars = {'a','b','c','d','e','f','g','h'};
    rankChars = {'1','2','3','4','5','6','7','8'};
    characters = num2cell(move); %Get the characters by themselves
    %For most cases, moves will be 3 or 4 letters long, with the last two
    %characters being the target square and the first letter being the
    %piece getting moved. If it's a capture, then there is sometimes an 'x'
    %in between the piece and the square. Pawn moves will just be the
    %target square unless its a capture, in which case it will be the file
    %of the pawn, an 'x', and then the target square.
    len = length(characters);
    flag = 1;
    for chr = 1:len
        if ~ismember(characters{chr},approvedChars) %Screen the move for invalid characters
            flag = 0;
        end
    end
    for chr = length(characters):-1:1 %the 'x' denoting a capture is not relevant and can be deleted
        if characters{chr} == 'x'
            characters(chr) = [];
        end
    end
    if flag
        if len == 2 %Is a basic pawn move
            if ismember(characters{1}, fileChars) && ismember(characters{2}, rankChars)
                rank = characters{2};
                file = characters{1}-96;
                if ~game.Turn
                    [origin(1),~] = find(game.Board(:,file) == 9);
                else
                    [origin(1),~] = find(game.Board(:,file) == 17);
                end
                if ~isempty(origin)
                    origin(2) = file;
                    move = [origin rank file];
                else
                    move = [];
                    disp('Invalid move, please try again')
                end
            end
        elseif len == 3
            if ismember(characters{1}, fileChars)  && ismember(characters{2}, fileChars) ...
               && ismember(characters{3},rankChars) %pawn capture
                rank = characters{3};
                file = characters{2}-96;
                if ~game.Turn
                    [origin(1),~] = find(game.Board(:,file) == 9);
                else
                    [origin(1),~] = find(game.Board(:,file) == 17);
                end
                if ~isempty(origin)
                    origin(2) = file;
                    move = [origin rank file];
                else
                    move = [];
                    disp('Invalid move, please try again')
                end
            elseif ismember(characters{1},pieceChars) && ismember(characters{2}, fileChars) ...
                   && ismember(characters{3},rankChars) %Regular piece move
                piece = pieceStruct.(characters{1});
                
            end
        end
        
    else
        move = [];
        disp('One or more characters entered were invalid, please try again.')
    end
end