% Chess in MATLAB V1 - The very first iteration of Chess in MATLAB. The
% goal has changed from a GUI to a playable text version. There will be no
% graphics and input will come from the command line. Hopefully it goes
% better than trying to make a UI right out the gate.

import importFEN.*
import PieceClass.*

game = importFEN(input('To begin, input a valid FEN String.', s));


