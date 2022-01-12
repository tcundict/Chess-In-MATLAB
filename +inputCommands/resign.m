function [game, moveAccepted, flag] = resign(game, ~, moveAccepted, flag)
    response = strip(input('Are you sure you want to resign? (y/yes, n/no): ','s'));
    if isequal(response, 'y') || isequal(response, 'yes')
        flag = 1;
        game.State = 6;
        moveAccepted = 1;
    end
end