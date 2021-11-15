% Takes in a single character from the FEN string and returns which side has
% has the current move. White to play is 0, Black to play is 1.

function turn = createTurn(character)
if char(character) == 'w'
    turn = 0;
elseif char(character) == 'b'
    turn = 1;
else
   error = MException('importFEN:InvalidTurn',...
        'Active color must be represented by ''w'' or ''b'' in FEN notation');
    throw(error) 
end
end


