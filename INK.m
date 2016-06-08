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
global Beamflag;
Beamflag=1;
global drawing;
drawing =0;
set(gcf,'WindowButtonDownFcn',@mouseDown)
set(gcf,'WindowButtonMotionFcn',@mouseMove)
set(gcf,'WindowButtonUpFcn',@mouseUp)
%  set(handles.loadpntslider,'Enable','off')
global pnt
global Npnt
% global fctr;
% global sctr;
global ctr;
ctr=0;
% fctr=0;
% sctr=0;
clear global index
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
global WL;
global WR;
global PV1;global PV2;
global force; global TR;
global Beamflag;
global allcenter;
clear global allcenter;
Beamflag=1;
flag=0;
force=0;
clear global force;clear global TR;
clear global WR;clear global WL;clear global PV1; clear global PV2;
clear global beam;
clear global ctr;
clear global index;
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
% global fctr;
% global sctr;
global beam;
global force;
global Configid;

[load,len]=getparametrs(beam,force);
set(handles.edit1,'String',strcat(num2str(load),' N'),'fontsize',16);
%Maxdeflection=lookuptable(Configid);
Maxdeflection=(load*(len)^3)/(3*1000*1000);
set(handles.text2,'String',num2str(Maxdeflection),'fontsize',16);
axes(handles.axes1);
hold on
Ft=cell2mat(force.pnts);
x1=beam.pnts(1,1);y1=beam.pnts(1,2);
x2=Ft(1,1);
x3=beam.pnts(2,1);y3=beam.pnts(2,2);
xx1=beam.pnts(4,1);yy1=beam.pnts(4,2);
xx2=Ft(1,1);
xx3=beam.pnts(3,1);yy3=beam.pnts(3,2);

for i=1:20
    y2=beam.pnts(2,2)-(beam.pnts(2,1)-beam.pnts(1,1))/8*(i/20);
    yy2=beam.pnts(3,2)-(beam.pnts(2,1)-beam.pnts(1,1))/8*(i/20);
    SP1=[x1,y1;x2,y2;x3,y3];
    SP2=[xx1,yy1;xx2,yy2;xx3,yy3];
    h1=Deflection1(SP1);
    h2=Deflection1(SP2);
    pause(0.1);
    delete(h1);
    delete(h2);
end
y2=beam.pnts(2,2)-(beam.pnts(2,1)-beam.pnts(1,1))/8;
yy2=beam.pnts(3,2)-(beam.pnts(2,1)-beam.pnts(1,1))/8;
SP1=[x1,y1;x2,y2;x3,y3];
SP2=[xx1,yy1;xx2,yy2;xx3,yy3];
h1=Deflection1(SP1);
h2=Deflection1(SP2);

% dlmwrite('InkData.txt',pnt);


function mouseDown(hObject, eventdata, handles)
global drawing
global flag
global state;
global beam;
global force;
if ~(isempty(beam)) && ~(isempty(force)) 
    state='Modification';
else
    state='Initial';
end    
flag=0;
drawing = 1;




function mouseUp(hObject, eventdata, handles)
global drawing
global flag
global pnt
global h;
global Npnt;
% global fctr;
% global sctr;
global beam;
global WL;
global WR;
global PV1;global PV2;
global force; global TR;
global Uniforce; global Slopeforce;
global Configid;
global Hbeam; global Hforce;global HwallL; global HwallR;global HPV1; global HPV2;global Hudl;global Huvl;
global HTR;
global Beamflag;
global allcenter;
% global ctr;
% global index;
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
    if Beamflag==1  % just creat Beam at first
        shape = 'Beam';
        set(handles.text1,'string',shape,'fontsize',20);
        delete(h(:));
        H1=BeamRedraw(pnt); % just redraw Beam
        beam.pnts(:,1)=get(H1,'XData')';  % store information for redraw other symbols
        beam.pnts(:,2)=get(H1,'YData')';
        % re-initialization
        pnt = zeros(1000,3);
        Npnt = 0;
        Beamflag=0;
    else
%         dlmwrite('InkData',pnt);
        Candidate=pnt;  % candidate
        %     ctr=ctr+1;
        if isempty(Candidate)==0
            BP=beam.pnts;
            [index,shape,centr] = ImageClassifier(Candidate,BP); %Image based classifier
            set(handles.text1,'string',shape,'fontsize',20);
            delete(h(:));
            H2=Redraw(index,pnt,BP);
            switch shape
                case 'Wall_Left'
                    %             sctr=sctr+1;
                    WL.pnts(:,1)=get(H2,'XData')';
                    WL.pnts(:,2)=get(H2,'YData')';
                    WL.center=centr;
                    HwallL=H2;
                    allcenter(1,:)=centr;
                case 'Wall_Right'
                    %             sctr=sctr+1;
                    WR.pnts(:,1)=get(H2,'XData')';
                    WR.pnts(:,2)=get(H2,'YData')';
                    WR.center=centr;
                    HwallR=H2;
                    allcenter(2,:)=centr;
                case 'Pivot_1'
                    %             sctr=sctr+1;
                    PV1.pnts(:,1)=get(H2,'XData')';
                    PV1.pnts(:,2)=get(H2,'YData')';
                    PV1.center=centr;
                    HPV1=H2;
                    allcenter(3,:)=centr;
                case 'Pivot_2'
                    %             sctr=sctr+1;
                    PV2.pnts(:,1)=get(H2,'XData')';
                    PV2.pnts(:,2)=get(H2,'YData')';
                    PV2.center=centr;
                    allcenter(4,:)=centr;
                    HPV2=H2;
                case 'Force'
                    force.pnts(:,1)=get(H2,'XData')';
                    force.pnts(:,2)=get(H2,'YData')';
                    force.center=centr;
                    Hforce=H2;
                    allcenter(5,:)=centr;
                    
                case 'Torque'
                    %             fctr=fctr+1;
                    TR.pnts(:,1)=get(H2,'XData')';
                    TR.pnts(:,2)=get(H2,'YData')';
                    TR.center=centr;
                    allcenter(6,:)=centr;
                    HTR=H2;
                case 'Uniforce'
                    Uniforce.pnts(:,1)=get(H2,'XData')';
                    Uniforce.pnts(:,2)=get(H2,'YData')';
                    Uniforce.center=centr;
                    allcenter(7,:)=centr;
                    Hudl=H2;
                case 'Slopeforce'
                    Slopeforce.pnts(:,1)=get(H2,'XData')';
                    Slopeforce.pnts(:,2)=get(H2,'YData')'; 
                    Slopeforce.center=centr;
                    allcenter(8,:)=centr;
                    Huvl=H2;
                case 'Delete'
%                     allcenter=[WL.center;WR.center;PV1.center;PV2.center;force.center;...
%                     TR.center;Uniforce.center;Slopeforce.center];
                      for i=1:size(allcenter,1);
                          if sum(abs(allcenter(i,:)))==0
                              allcenter(i,:)=[100,100];
                          end
                      end
                      [~,num]=min(pdist2(H2,allcenter));
                    removfig(num,HwallL,HwallR,HPV1,HPV2,Hforce,HTR,Hudl,Huvl);
            end
        end
    end
    pnt = zeros(1000,3);
    Npnt = 0;
if ~(isempty(beam)) && ~(isempty(force)) && ... 
    (~(isempty(WL)) || ~(isempty(WR)) || ~(isempty(PV1)) || ~(isempty(PV2)))
 Configid=findconfiguration(force,WL,WR,PV1,PV2,TR);
%  delete(Hforce);
%  delete(HwallL);
%  [Hforce,HwallL]=beautify(beam,force,WL,WR,PV1,PV2,TR);
 end
end

function mouseMove(hObject, eventdata, handles)
global drawing
global Npnt
global pnt
global h;
global state;
global Hforce;
global Hbeam;
global beam;
global force;
global flag
flag=0;
C2=get(gca,'CurrentPoint');
state=checkstate(C2,beam,force);
if strcmp(state,'Modification-force')
     set(gcf,'Pointer','hand');
else
     set(gcf,'Pointer','arrow');
end     
if drawing && strcmp(state,'Initial') 
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
elseif drawing && strcmp(state,'Modification-force')

 delete(Hforce);
 temp=cell2mat(force.pnts);
 dl=temp(2,1)-temp(2,2);dr=temp(3,2)-temp(3,1);
 temp(:,1)=C2(1,1);
 temp(1,2)=C2(1,1);
temp(2,2)=C2(1,1)-dl;
temp(3,2)=C2(1,1)+dr;
hi(1)=plot([temp(1,1),temp(1,2)],[temp(1,3),temp(1,4)],'g','linewidth',3);
hold on
hi(2)=plot([temp(2,1),temp(2,2)],[temp(2,3),temp(2,4)],'g','linewidth',3);
hi(3)=plot([temp(3,1),temp(3,2)],[temp(3,3),temp(3,4)],'g','linewidth',3);
Hforce=hi;
force.pnts(:,1)=get(Hforce,'XData')';
force.pnts(:,2)=get(Hforce,'YData')';

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


