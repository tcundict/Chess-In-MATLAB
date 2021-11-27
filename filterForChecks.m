%Filters out moves that are illegal because of pins and moves that don't
%resolve checks. Is based on the idea that if you move a piece and you're
%still in check then that move is illegal.
function moveList = filterForChecks(game)  
for move = size(game.moveList,1):-1:1
    tempGame = game.makeMove(game.moveList(move,:));
    tempGame.Turn = ~tempGame.Turn; %makeMove automatically changes the 
                                    %turn but if we leave it that way, then
                                    %isInCheck will not work as intended.
    if isInCheck(tempGame)
        game.moveList(move,:) = [];
    end
end
moveList = game.moveList;
end