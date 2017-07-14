function varargout = A14021051(varargin)
% A14021051 MATLAB code for A14021051.fig
%      A14021051, by itself, creates a new A14021051 or raises the existing
%      singleton*.
%
%      H = A14021051 returns the handle to a new A14021051 or the handle to
%      the existing singleton*.
%
%      A14021051('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A14021051.M with the given input arguments.
%
%      A14021051('Property','Value',...) creates a new A14021051 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A14021051_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A14021051_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A14021051
% Last Modified by GUIDE v2.5 27-May-2017 17:51:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A14021051_OpeningFcn, ...
                   'gui_OutputFcn',  @A14021051_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before A14021051 is made visible.
function A14021051_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A14021051 (see VARARGIN)

% Choose default command line output for A14021051
handles.output = hObject;

Lena=imread('lena.bmp');
hAxe=axes('Parent',gcf,... % 设置新的axe， 将'parent' 属性设置为当前窗口gcf
    'Units','pixels',...  %设置单位为pixels
    'Position',[57 49 256 256]);  
axes(hAxe);
imshow(Lena)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A14021051 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A14021051_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
%function pushbutton1_Callback(hObject, eventdata, handles)
function varargout = exit_Callback(h,eventdata,handles,varargin)
close(gcf);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on edit5 and none of its controls.
function edit5_KeyPressFcn(hObject, eventdata, handles)


function experiment1_Callback(hObject, eventdata, handles)
    experiment1();

function experiment2_Callback(hObject, eventdata, handles)
    experiment2();

function experiment3_Callback(hObject, eventdata, handles)
    experiment3();

function experiment4_Callback(hObject, eventdata, handles)
    experiment4();

function Exit_Callback(hObject, eventdata, handles)
close(gcf);

function experiment5_Callback(hObject, eventdata, handles)
experiment5();
