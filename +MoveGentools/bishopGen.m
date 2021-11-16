function moveList = bishopGen(game, origin)
vectors = {[-1 -1], [-1 1], [1 1], [1 -1]};
maxMoves = 13;
moveList = MoveGentools.slidingGen(game, vectors, maxMoves, origin);
end
