function moveList = queenGen(game, origin)
vectors = {[0 -1], [0 1], [-1 0], [1 0], [-1 -1], [-1 1], [1 1], [1 -1]};
maxMoves = 27;
moveList = MoveGentools.slidingGen(game, vectors, maxMoves, origin);
end