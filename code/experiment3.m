function varargout = experiment3(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment3_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
function experiment3_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

%-----------¶ÁÈ¡Ô­Í¼Ïñ--------------
p1=imread('dock.png');
subplot(1,3,1);
imshow(p1);
title('Ô­Í¼');
% Update handles

guidata(hObject, handles);

function varargout =experiment3_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function title_CreateFcn(hObject, eventdata, handles)

function DIVIDE_Callback(hObject, eventdata, handles)
flag=1;             % determine current status
filter_segment;

% --------------------------------------------------------------------
function ERODE_Callback(hObject, eventdata, handles)
flag=2;
filter_segment;
for card=1:3
    erode_exp3(card,flag,dock3);
end

% --------------------------------------------------------------------
function DILATE_Callback(hObject, eventdata, handles)
flag=2;
filter_segment;
for card=1:3
    dilate_exp3(card,flag,dock3);
end

% --------------------------------------------------------------------
function OVERALL_Callback(hObject, eventdata, handles)
flag=3;
filter_segment;
for card=1:3
    erode_exp3(card,flag,dock3);
    dilate_exp3(card,flag,dock3);
end


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
close(gcf);


% --------------------------------------------------------------------
function experiment3_Callback(hObject, eventdata, handles)
