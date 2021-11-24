%Board made by me, Tom Cundict using GIMP, pieces from Wikimedia Foundation:
%https://commons.wikimedia.org/wiki/Category:SVG_chess_pieces

close
mainFig = figure;
boardImg = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\1920Board.png');
subimage(0,0,boardImg) %#ok<*SUBIMGNR>
hold on
axis off
positions = [0,240,480,720,960,1200,1440,1680,1920];
imageMatrix = cell(12,2);
[imageMatrix{1,1},~,imageMatrix{1,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bPawn.png');
[imageMatrix{2,1},~,imageMatrix{2,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bKnight.png');
[imageMatrix{3,1},~,imageMatrix{3,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bBishop.png');
[imageMatrix{4,1},~,imageMatrix{4,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bRook.png');
[imageMatrix{5,1},~,imageMatrix{5,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bQueen.png');
[imageMatrix{6,1},~,imageMatrix{6,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\bKing.png');
[imageMatrix{7,1},~,imageMatrix{7,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wPawn.png');
[imageMatrix{8,1},~,imageMatrix{8,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wKnight.png');
[imageMatrix{9,1},~,imageMatrix{9,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wBishop.png');
[imageMatrix{10,1},~,imageMatrix{10,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wRook.png');
[imageMatrix{11,1},~,imageMatrix{11,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wQueen.png');
[imageMatrix{12,1},~,imageMatrix{12,2}] = imread('E:\School\1stYearEngg\ENCMP 100\Chess In MATLAB\ChessImg240\wKing.png');
     

bP1 = imshow(imageMatrix{1,1});
set(bP1,'AlphaData',imageMatrix{1,2});
set(bP1,'XData', [positions(1) positions(2)]);
set(bP1,'YData', [positions(2) positions(3)]);

bP2 = imshow(imageMatrix{1,1});
set(bP2,'AlphaData',imageMatrix{1,2});
set(bP2,'XData', [positions(2) positions(3)]);
set(bP2,'YData', [positions(2) positions(3)]);

bP3 = imshow(imageMatrix{1,1});
set(bP3,'AlphaData',imageMatrix{1,2});
set(bP3,'XData', [positions(3) positions(4)]);
set(bP3,'YData', [positions(2) positions(3)]);

bP4 = imshow(imageMatrix{1,1});
set(bP4,'AlphaData',imageMatrix{1,2});
set(bP4,'XData', [positions(4) positions(5)]);
set(bP4,'YData', [positions(2) positions(3)]);
