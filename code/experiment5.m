function varargout = experiment5(varargin)
% EXPERIMENT5 MATLAB code for experiment5.fig
%      EXPERIMENT5, by itself, creates a new EXPERIMENT5 or raises the existing
%      singleton*.
%
%      H = EXPERIMENT5 returns the handle to a new EXPERIMENT5 or the handle to
%      the existing singleton*.
%
%      EXPERIMENT5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPERIMENT5.M with the given input arguments.
%
%      EXPERIMENT5('Property','Value',...) creates a new EXPERIMENT5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before experiment5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to experiment5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help experiment5

% Last Modified by GUIDE v2.5 09-Jun-2017 16:13:21

% start_train initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment5_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment5_OutputFcn, ...
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


% --- Executes just before experiment5 is made visible.
function experiment5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to experiment5 (see VARARGIN)

void = imread('void.bmp');
axes(handles.axes1)
imshow(void);


% Choose default command line output for experiment5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes experiment5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = experiment5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start_train.
function start_train_Callback(hObject, eventdata, handles)
% hObject    handle to start_train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
train;
set(handles.precision,'string',precision);
fprintf('done');


% --- Executes on button press in start_read.
function start_read_Callback(hObject, eventdata, handles)
% hObject    handle to start_read (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global test species k
axes(handles.axes1)
imshow(test{k});
set(handles.result,'string',species(k));
k=k+1;



function precision_Callback(hObject, eventdata, handles)
% hObject    handle to precision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of precision as text
%        str2double(get(hObject,'String')) returns contents of precision as a double


% --- Executes during object creation, after setting all properties.
function precision_CreateFcn(hObject, eventdata, handles)
% hObject    handle to precision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function Exit_Callback(hObject, eventdata, handles)
close(gcf);

% 
% % --- Executes on button press in pushbutton4.
% function pushbutton4_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
