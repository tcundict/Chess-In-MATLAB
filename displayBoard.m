%Board made by me, Tom Cundict using GIMP, pieces from Wikimedia Foundation:
%https://commons.wikimedia.org/wiki/Category:SVG_chess_pieces
%Board is 1920x1920, pieces are all 240x240 pngs with transparent pixels.
function displayBoard(game)
close
boardImg = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\1920Board.png');
subimage(0,0,boardImg) %#ok<*SUBIMGNR>
hold on
axis off
xPos = [0,240,480,720,960,1200,1440,1680,1920];
yPos = [1920,1680,1440,1200,960,720,480,240,0];
%initialize images of pieces
imgData = cell(12,2);
[imgData{1,1},~,imgData{1,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wPawn.png');
[imgData{2,1},~,imgData{2,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wKnight.png');
[imgData{3,1},~,imgData{3,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wBishop.png');
[imgData{4,1},~,imgData{4,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wRook.png');
[imgData{5,1},~,imgData{5,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wQueen.png');
[imgData{6,1},~,imgData{6,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wKing.png');
[imgData{7,1},~,imgData{7,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bPawn.png');
[imgData{8,1},~,imgData{8,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bKnight.png');
[imgData{9,1},~,imgData{9,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bBishop.png');
[imgData{10,1},~,imgData{10,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bRook.png');
[imgData{11,1},~,imgData{11,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bQueen.png');
[imgData{12,1},~,imgData{12,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bKing.png');


piecePictures = cell(32);
[rank, file] = find(game.pBit);
for i = 1:length(rank)
    piece = game.Board(rank(i),file(i));
    pause(0.05) %Not pausing here creates the nightmare board, don't know why
    if ~getColour(piece) %white piece
        imgNum = game.Board(rank(i),file(i))-8;
        piecePictures{i} = imshow(imgData{imgNum,1});
        set(piecePictures{i},'AlphaData',imgData{imgNum,2});
        set(piecePictures{i},'XData', [xPos(file(i)) xPos(file(i)+1)]);
        set(piecePictures{i},'YData', [yPos(rank(i)+1) yPos(rank(i))]);
    else
        imgNum = game.Board(rank(i),file(i))-10;
        piecePictures{i} = imshow(imgData{imgNum,1});
        set(piecePictures{i},'AlphaData',imgData{imgNum,2});
        set(piecePictures{i},'XData', [xPos(file(i)) xPos(file(i)+1)]);
        set(piecePictures{i},'YData', [yPos(rank(i)+1) yPos(rank(i))]);
    end 
end

    
    
    
% bP1 = imshow(imageData{1,1});
% set(bP1,'AlphaData',imageData{1,2});
% set(bP1,'XData', [positions(1) positions(2)]);
% set(bP1,'YData', [positions(2) positions(3)]);
% 
% bP2 = imshow(imageData{1,1});
% set(bP2,'AlphaData',imageData{1,2});
% set(bP2,'XData', [positions(2) positions(3)]);
% set(bP2,'YData', [positions(2) positions(3)]);
% 
% bP3 = imshow(imageData{1,1});
% set(bP3,'AlphaData',imageData{1,2});
% set(bP3,'XData', [positions(3) positions(4)]);
% set(bP3,'YData', [positions(2) positions(3)]);
% 
% bP4 = imshow(imageData{1,1});
% set(bP4,'AlphaData',imageData{1,2});
% set(bP4,'XData', [positions(4) positions(5)]);
% set(bP4,'YData', [positions(2) positions(3)]);
