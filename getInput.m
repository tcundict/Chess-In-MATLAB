function [game, errorDisplayed, moveAccepted, flag, move] = getInput(game)
import inputCommands.*
errorDisplayed = false;
moveAccepted = false;  
flag = false;
move = [];
input1 = strip(input('Staring square of piece or a command: ', 's'));
if isempty(input1)
    errorDisplayed = true;
    return
end
commandNotations = {'O-O', 'O-O-O', 'draw','resign'};
commandFuncs = {@kingCastle, @queenCastle, @offerDraw, @resign};
for i = 1:length(commandNotations)
    ind = 0;
    if isequal(input1, commandNotations{i})
        ind = i;
        break
    end
end
if ind ~= 0 %user has entered a valid command
    chosenCommand = commandFuncs{ind};
    if nargout(chosenCommand) == 2
        [game, moveAccepted] = chosenCommand(game);
    else
        [game, moveAccepted, flag] = chosenCommand(game, ...
                                                    errorDisplayed, ...
                                                    moveAccepted, flag);
    end
    errorDisplayed = 1;
else
    errorDisplayed = 0; 
    fileChars = {'a','b','c','d','e','f','g','h'};
    rankChars = {'1','2','3','4','5','6','7','8'};
    tgtSquare = strip(input('Target square of piece: ','s'));
    move = [input1 tgtSquare];
    characters  = num2cell(move); % get cell array of chars
    if ismember(characters{1}, fileChars) && ismember(characters{2}, rankChars) ...
            && ismember(characters{3}, fileChars) && ismember(characters{4}, rankChars)...
            && size(characters,2) == 4  %squares were valid, 2 squares given
        move = [str2double(characters{2}) characters{1}-96 ...
            str2double(characters{4}) characters{3}-96];
    else
        move = [];
        disp('Invalid notation, please try again.')
        errorDisplayed = true;
    end
end
end