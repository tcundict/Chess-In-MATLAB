
boardFigure = uifigure('Name','Chess In MATLAB','NumberTitle','off',...
    'Position',[500 200 1024 1024],'Resize', 'off');


pieceGrid = uigridlayout(boardFigure, [8 8]);
pieceGrid.ColumnWidth = [128 128 128 128 128 128 128 128];
pieceGrid.RowHeight = [128 128 128 128 128 128 128 128];



% bPawn1 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn1.Layout.Row = 1;
% bPawn1.Layout.Column = 1;
% 
% bPawn2 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn2.Layout.Row = 1;
% bPawn2.Layout.Column = 2;
% 
% bPawn3 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn3.Layout.Row = 1;
% bPawn3.Layout.Column = 3;
% 
% bPawn4 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn4.Layout.Row = 1;
% bPawn4.Layout.Column = 4;
% 
% bPawn5 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn5.Layout.Row = 1;
% bPawn5.Layout.Column = 5;
% 
% bPawn6 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn6.Layout.Row = 1;
% bPawn6.Layout.Column = 6;
% 
% bPawn7 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn7.Layout.Row = 1;
% bPawn7.Layout.Column = 7;
% 
% bPawn8 = uiimage(pieceGrid,'ImageSource', 'bPawn.png');
% bPawn8.Layout.Row = 1;
% bPawn8.Layout.Column = 8;


% % code fragments
clear
%Initializing the board with background image and setting the axes properly
%size is 1024 by 1024



boardFigure = uifigure('Name','Chess In MATLAB','NumberTitle','off',...
    'Position',[500 200 1024 1024],'Resize', 'off');



boardPixelPos = [64:128:960];
bPawn = uiimage(boardFigure,'ImageSource', 'bPawn.png',...
    'Position', [64 832 68 88]);




%use image to display pieces
%