%Takes a game object, and creates a figure that displays the board for that
%game. Board made by me, using GIMP. Pieces from Wikimedia Foundation:
%https://commons.wikimedia.org/wiki/Category:SVG_chess_pieces
%Board is 1920x1920, pieces are all 240x240 pngs with transparent pixels.
function displayBoard(game)
mainFig = figure('WindowStyle','docked');
mainAx = gca;
boardImg = imread(fullfile('ChessImg240','1920Board.png'));
subimage(0,0,boardImg) %#ok<*SUBIMGNR>
hold on
set(mainFig, 'currentaxes', mainAx);
axis([0 1920 0 1920])
tickspaces = linspace(120, 1800, 8);
xticks(tickspaces)
yticks(tickspaces)
xticklabels({'a','b','c','d','e','f','g','h'})
yticklabels({'8','7','6','5','4','3','2','1'})
xPos = [0,240,480,720,960,1200,1440,1680,1920];
yPos = [1920,1680,1440,1200,960,720,480,240,0];
if ~game.Turn
    title('White to play')
else
    title('Black to play')
end
%initialize images of pieces

persistent imgData
if isempty(imgData)
imgData = cell(12,2);
[imgData{1,1},~,imgData{1,2}] = imread(fullfile('ChessImg240','wPawn.png'));
[imgData{2,1},~,imgData{2,2}] = imread(fullfile('ChessImg240','wKnight.png'));
[imgData{3,1},~,imgData{3,2}] = imread(fullfile('ChessImg240','wBishop.png'));
[imgData{4,1},~,imgData{4,2}] = imread(fullfile('ChessImg240','wRook.png'));
[imgData{5,1},~,imgData{5,2}] = imread(fullfile('ChessImg240','wQueen.png'));
[imgData{6,1},~,imgData{6,2}] = imread(fullfile('ChessImg240','wKing.png'));
[imgData{7,1},~,imgData{7,2}] = imread(fullfile('ChessImg240','bPawn.png'));
[imgData{8,1},~,imgData{8,2}] = imread(fullfile('ChessImg240','bKnight.png'));
[imgData{9,1},~,imgData{9,2}] = imread(fullfile('ChessImg240','bBishop.png'));
[imgData{10,1},~,imgData{10,2}] = imread(fullfile('ChessImg240','bRook.png'));
[imgData{11,1},~,imgData{11,2}] = imread(fullfile('ChessImg240','bQueen.png'));
[imgData{12,1},~,imgData{12,2}] = imread(fullfile('ChessImg240','bKing.png'));
end
colormap gray %Gets rid of yellow and blue pieces

piecePictures = cell(32);
[rank, file] = find(game.pBit); %Get locations of all the pieces
for i = 1:length(rank)
    piece = game.Board(rank(i),file(i));
    pause(0.02) %Not pausing here creates the nightmare board, unclear why
    if ~getColour(piece) %white piece
        imgNum = game.Board(rank(i),file(i))-8;
        piecePictures{i} = image(imgData{imgNum,1});
        set(piecePictures{i},'AlphaData',imgData{imgNum,2});
        set(piecePictures{i},'XData', [xPos(file(i)) xPos(file(i)+1)]);
        set(piecePictures{i},'YData', [yPos(rank(i)+1) yPos(rank(i))]);
    else
        imgNum = game.Board(rank(i),file(i))-10;
        piecePictures{i} = image(imgData{imgNum,1});
        set(piecePictures{i},'AlphaData',imgData{imgNum,2});
        set(piecePictures{i},'XData', [xPos(file(i)) xPos(file(i)+1)]);
        set(piecePictures{i},'YData', [yPos(rank(i)+1) yPos(rank(i))]);
    end 
end
commandwindow