function moveList = rookGen(game, origin)
vectors = {[0 -1], [0 1], [-1 0], [1 0]};
maxMoves = 14;
moveList = MoveGentools.slidingGen(game, vectors, maxMoves, origin);
end