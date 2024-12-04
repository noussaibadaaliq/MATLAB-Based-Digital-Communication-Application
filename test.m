function varargout = Application(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 30-May-2022 11:57:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[Y e DSP f ] = NRZ(M)
plot(e,'g')
title('NRZ');
xlabel('Temps');
ylabel('Amplitude');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[Y e DSP f ] = RZ(M)
plot(e,'g')
title('RZ');
xlabel('Temps');
ylabel('Amplitude');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[Y, e, DSP, f, t ] = Manchester(M)
plot(e,'g')
title('Manchester');
xlabel('Temps');
ylabel('Amplitude');

% --- Executes on button press in pushbutton5.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[Y e DSP f ] = NRZ(M)
plot(f,DSP,'r')
title('DSP de NRZ');
xlabel('Frequence (Hz)');
ylabel('dB');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[Y e DSP f ] = RZ(M)
plot(f,DSP,'r')
title('DSP de RZ');
xlabel('Frequence (Hz)');
ylabel('dB');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[Y e DSP f ] = Manchester(M)
plot(DSP,'r')
title('DSP de Manchester');
xlabel('Frequence (Hz)');
ylabel('dB');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[modSig, t3] = Modulations_FSK(M)
plot(t3,modSig);
xlabel('Time');
ylabel('Amplitude');
title('FSK Modulated Signal');

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes4);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[modSig, t3] = Modulations_FSK(M)
[rx, sampleValue] = Bruit(modSig)
 plot(rx,'r');
 title('Signal bruite');
 
 



function edit1_Callback(hObject, ~, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes5);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[modSig,t3] = Modulation_ASK(M)
plot(t3,modSig,'g');
title('ASK Modulated Signal');


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[modSig, t3] = Modulations_FSK(M)
[rx, sampleValue] = Bruit(modSig)
[digit, t5] = Demodulations_FSK(modSig)
plot(t5,digit,'LineWidth',2.5);
title('FSK Demodulated Signal');

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[modSig, t3] = Modulation_ASK(M)
[rx, sampleValue] = Bruit(modSig)
[bit, t4] = Demodulation_ASK(modSig)
plot(t4,bit,'g','LineWidth',2.5);
ylabel('Amplitude');
xlabel('Time(sec)');
title('ASK demodulation signal');

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes6);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
[modSig, t3] = Modulations_FSK(M)
[rx, sampleValue] = Bruit(modSig)
[filtData, decision] = signal_sortie(M, rx, t3, sampleValue) 
stem(decision,'k','Linewidth',2);
title('Signal de sortie');
 xlabel('Temps');
 ylabel('Amplitude');

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes7);
M=[0 1 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 1 0 1 ];
stem(M);
title('input message')
