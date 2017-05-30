function varargout = gcs2017(varargin)
% GCS2017 MATLAB code for gcs2017.fig
%      GCS2017, by itself, creates a new GCS2017 or raises the existing
%      singleton*.
%
%      H = GCS2017 returns the handle to a new GCS2017 or the handle to
%      the existing singleton*.
%
%      GCS2017('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GCS2017.M with the given input arguments.
%
%      GCS2017('Property','Value',...) creates a new GCS2017 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gcs2017_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gcs2017_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gcs2017

% Last Modified by GUIDE v2.5 29-May-2017 18:49:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gcs2017_OpeningFcn, ...
                   'gui_OutputFcn',  @gcs2017_OutputFcn, ...
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


% --- Executes just before gcs2017 is made visible.
function gcs2017_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gcs2017 (see VARARGIN)

% Choose default command line output for gcs2017
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gcs2017 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Initial Arduino COMPORT Setup.
setCOMPort(handles);


% --- Outputs from this function are returned to the command line.
function varargout = gcs2017_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in COMSelect.
function COMSelect_Callback(hObject, eventdata, handles)
% hObject    handle to COMSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setCOMPort(handles);

% Hints: contents = cellstr(get(hObject,'String')) returns COMSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from COMSelect


% --- Executes during object creation, after setting all properties.
function COMSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COMSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in arduinoConnectButton.
function arduinoConnectButton_Callback(hObject, eventdata, handles)
% hObject    handle to arduinoConnectButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ard;
selectedPort = get(handles.COMSelect,'Value');
Portlist = get(handles.COMSelect,'String');
comport = Portlist{selectedPort};
ard = connectFunction(comport, handles);


% --- Executes during object creation, after setting all properties.
function uipanelGlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanelGlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uitableGlider_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitableGlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in uitableGlider.
function uitableGlider_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitableGlider (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitableGlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitableGlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in graphxAxis.
function graphxAxis_Callback(hObject, eventdata, handles)
% hObject    handle to graphxAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graphxAxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graphxAxis


% --- Executes during object creation, after setting all properties.
function graphxAxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graphxAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graphyAxis.
function graphyAxis_Callback(hObject, eventdata, handles)
% hObject    handle to graphyAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graphyAxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graphyAxis


% --- Executes during object creation, after setting all properties.
function graphyAxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graphyAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function logo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate logo
imshow('Team_Tomahawk_logo.JPG');


% --- Executes on button press in stopTimer.
function stopTimer_Callback(hObject, eventdata, handles)
% hObject    handle to stopTimer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
