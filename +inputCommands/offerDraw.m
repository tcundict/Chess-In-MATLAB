function [game, moveAccepted, flag] = offerDraw(game, ~, ...
                                                      moveAccepted, flag)
if ~game.Turn
    str1 = 'White offers a draw.';
    str2 = 'Response from Black? (y/yes, n/no): ';
else
    str1 = 'Black offers a draw.';
    str2 = 'Response from White? (y/yes, n/no): ';
end

disp(str1)
response = strip(input(str2,'s'));
if isequal(response, 'y') || isequal(response, 'yes')
    flag = 1;
    game.State = 5;
    moveAccepted = 1;
end
end
