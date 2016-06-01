function varargout = INK(varargin)
% INK MATLAB code for INK.fig
%      INK, by itself, creates a new INK or raises the existing
%      singleton*.
%
%      H = INK returns the handle to a new INK or the handle to
%      the existing singleton*.
%
%      INK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INK.M with the given input arguments.
%
%      INK('Property','Value',...) creates a new INK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before INK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to INK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help INK

% Last Modified by GUIDE v2.5 31-May-2016 22:06:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @INK_OpeningFcn, ...
    'gui_OutputFcn',  @INK_OutputFcn, ...
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


% --- Executes just before INK is made visible.
function INK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to INK (see VARARGIN)

% Choose default command line output for INK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes INK wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global flag
flag=0;

global drawing;
drawing =0;
set(gcf,'WindowButtonDownFcn',@mouseDown)
set(gcf,'WindowButtonMotionFcn',@mouseMove)
set(gcf,'WindowButtonUpFcn',@mouseUp)
 set(handles.loadpntslider,'Enable','off')
global pnt
global Npnt
global fctr;
global sctr;


fctr=0;
sctr=0;

pnt = zeros(1000,3);
Npnt = 0;
tic

% --- Outputs from this function are returned to the command line.
function varargout = INK_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ClearButton.
function ClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to ClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1)
cla

set(handles.text1,'string',[]);
set(handles.text2,'string',[]);
set(handles.edit1,'string',[]);
global pnt
global Npnt
global flag
global force;
flag=0;
force=0;
clear global force;
clear global support;
clear global beam;
pnt = zeros(1000,3);
Npnt = 0;
clc


% --- Executes on button press in Analysis.
function Analysis_Callback(hObject, eventdata, handles)
% hObject    handle to Analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pnt;
global Npnt;
global fctr;
global sctr;
global beam;
global support;
global force;

[load,len]=getparametrs(beam,force);
set(handles.edit1,'String',strcat(num2str(load),' N'),'fontsize',16);
deflection=(load*(len)^3)/(3*1000*1000);
set(handles.text2,'String',num2str(deflection),'fontsize',16);


% dlmwrite('InkData.txt',pnt);


function mouseDown(hObject, eventdata, handles)
global drawing
global flag
flag=0;
drawing = 1;


function mouseUp(hObject, eventdata, handles)
global drawing
global flag
global pnt
global h;
global Npnt;
global fctr;
global sctr;
global beam;
global support;
global force;
global H3;
drawing = 0;
pause(1.5);
flag=flag+1;
% pause(1);
% flag=flag+1;


if flag==1
    handles=guidata(hObject);
     if Npnt<1000
         pnt(Npnt+1:end,:) =[];
          h(Npnt+1:end) =[];
     end
    
    Candidate=pnt;  % candidate
    
    [index,shape] = ImageClassifier(Candidate); %Image based classifier
           
    set(handles.text1,'string',shape,'fontsize',20);
    delete(h(:));
    H2=Redraw(index,pnt);
    switch shape
        case 'Beam'
            beam.pnts(:,1)=get(H2,'XData')';
            beam.pnts(:,2)=get(H2,'YData')';
        case 'Wall_Left'
            sctr=sctr+1;
            support(sctr).pnts(:,1)=get(H2,'XData')';
            support(sctr).pnts(:,2)=get(H2,'YData')';
            
        case 'Wall_Right'
            sctr=sctr+1;
            support(sctr).pnts(:,1)=get(H2,'XData')';
            support(sctr).pnts(:,2)=get(H2,'YData')';
        case 'Pivot_1'
            sctr=sctr+1;
            support(sctr).pnts(:,1)=get(H2,'XData')';
            support(sctr).pnts(:,2)=get(H2,'YData')';
        case 'Pivot_2'
            sctr=sctr+1;
            support(sctr).pnts(:,1)=get(H2,'XData')';
            support(sctr).pnts(:,2)=get(H2,'YData')';
        case 'Force'
            fctr=fctr+1;
            forceng(fctr).pnts(:,1)=get(H2,'XData')';
            forceng(fctr).pnts(:,2)=get(H2,'YData')';
            force=forceng;
            H3=H2;
            set(handles.loadpntslider,'Enable','on');
            temp=cell2mat(force.pnts);
            fstart=temp(1,1);
            bstart=beam.pnts(1,1);
            lnstart=fstart-bstart;
            set(handles.loadpntslider,'value',lnstart);
        case 'Torque'
            fctr=fctr+1;
            force(fctr).pnts(:,1)=get(H2,'XData')';
            force(fctr).pnts(:,2)=get(H2,'YData')';    
    end 
    pnt = zeros(1000,3);
    Npnt = 0;
  
end





function mouseMove(hObject, eventdata, handles)
global drawing
global Npnt
global pnt
global h;
global flag
flag=0;
if drawing
    C = get(gca,'CurrentPoint');
    if C(1,1)<1 && C(1,1)>0 && C(1,2)<1 && C(1,2)>0
        Npnt = Npnt+1;
        pnt(Npnt,1) = C(1,1);
        pnt(Npnt,2) = C(1,2);
        pnt(Npnt,3) = toc;
        
        h(Npnt)=plot(C(1,1),C(1,2),'k','marker','.','MarkerFaceColor','k');
        hold on
        
        xlim([0 1]); ylim([0 1]);
        set(gca,'XTick',[],'YTick',[])
        box on
        
    end
    
end



function edit1_Callback(hObject, eventdata, handles)
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


% --- Executes on slider movement.
function loadpntslider_Callback(hObject, eventdata, handles)
% hObject    handle to loadpntslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global H3;
global beam;
bstart=beam.pnts(1,1);
set(hObject,'Min',0);bmax=beam.pnts(2,1);
Ln = (get(hObject,'Value'));set(hObject,'Max',bmax-bstart);
set(handles.Loadpnt,'String',Ln);
forceng.pnts(:,1)=get(H3,'XData')';
forceng.pnts(:,2)=get(H3,'YData')';
temp=cell2mat(forceng.pnts);
dl=temp(2,1)-temp(2,2);dr=temp(3,2)-temp(3,1);
temp(:,1)=bstart+Ln; temp(1,2)=bstart+Ln;
temp(2,2)=bstart+Ln-dl;
temp(3,2)=bstart+Ln+dr;
delete(H3);
h(1)=plot([temp(1,1),temp(1,2)],[temp(1,3),temp(1,4)],'g','linewidth',3);
hold on
h(2)=plot([temp(2,1),temp(2,2)],[temp(2,3),temp(2,4)],'g','linewidth',3);
h(3)=plot([temp(3,1),temp(3,2)],[temp(3,3),temp(3,4)],'g','linewidth',3);
H3=h;

% --- Executes during object creation, after setting all properties.
function loadpntslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loadpntslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Loadpnt_Callback(hObject, eventdata, handles)
% hObject    handle to Loadpnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Loadpnt as text
%        str2double(get(hObject,'String')) returns contents of Loadpnt as a double
Ln=str2double(get(hObject,'String'));
set(handles.loadpntslider,'Value',Ln);
global H3;
global beam;
bstart=beam.pnts(1,1);
forceng.pnts(:,1)=get(H3,'XData')';
forceng.pnts(:,2)=get(H3,'YData')';
temp=cell2mat(forceng.pnts);
dl=temp(2,1)-temp(2,2);dr=temp(3,2)-temp(3,1);
temp(:,1)=bstart+Ln; temp(1,2)=bstart+Ln;
temp(2,2)=bstart+Ln-dl;
temp(3,2)=bstart+Ln+dr;
delete(H3);
h(1)=plot([temp(1,1),temp(1,2)],[temp(1,3),temp(1,4)],'g','linewidth',3);
hold on
h(2)=plot([temp(2,1),temp(2,2)],[temp(2,3),temp(2,4)],'g','linewidth',3);
h(3)=plot([temp(3,1),temp(3,2)],[temp(3,3),temp(3,4)],'g','linewidth',3);
H3=h;
% --- Executes during object creation, after setting all properties.
function Loadpnt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Loadpnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
