% Takes in specific string from the FEN string and returns which the 
% castling eligibiliy for each side, stored as a structure.
function Castling = createCastling(castleString)
castleString = char(castleString);
Castling = struct('wKingside', false, ...
                  'wQueenside', false, ...
                  'bKingside', false, ...
                  'bQueenside', false);
for i = 1:length(castleString)
    letter = castleString(i);
    if letter == 'K'
        Castling.wKingside = true;
    end
    
    if letter == 'Q'
        Castling.wQueenside = true;
    end
    
    if letter == 'k'
        Castling.bKingside = true;
    end
    
    if letter == 'q'
        Castling.bQueenside = true;
    end
end
end

