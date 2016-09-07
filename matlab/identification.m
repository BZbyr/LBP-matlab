function varargout = identification(varargin)
% IDENTIFICATION MATLAB code for identification.fig
%      IDENTIFICATION, by itself, creates a new IDENTIFICATION or raises the existing
%      singleton*.
%
%      H = IDENTIFICATION returns the handle to a new IDENTIFICATION or the handle to
%      the existing singleton*.
%
%      IDENTIFICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENTIFICATION.M with the given input arguments.
%
%      IDENTIFICATION('Property','Value',...) creates a new IDENTIFICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before identification_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to identification_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help identification

% Last Modified by GUIDE v2.5 06-Aug-2016 03:03:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @identification_OpeningFcn, ...
                   'gui_OutputFcn',  @identification_OutputFcn, ...
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


% --- Executes just before identification is made visible.
function identification_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to identification (see VARARGIN)

% Choose default command line output for identification
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes identification wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = identification_OutputFcn(hObject, eventdata, handles) 
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
[filename,pathname]=uigetfile({'*.jpg';'*.tif'},'file selector');
str=[pathname filename];
I=imread(str);
axes(handles.axes1);

imshow(I);

lbp_face=[];
[lbp_face,feature]=lbpfeaturevector2(I,100,20);
axes(handles.axes2);
imshow(feature);
load('fb_lbp_face.mat')
ss=[];
ss=LBP_face(:,:);
ref_labels=label;
ref_label=number_label;
L=zeros(1,size(ss,2));
text=[];
%d=sum((A-B).^2);

   for j=1:size(ss,2)
        w=0;
    for i=1:size(lbp_face,1) 
           %w=w+(h(i,1)-ss(i,j))^2;%≈∑ Ωæ‡¿Î
            %w=w-ss(i,j)*(log(h(i,1)+1e-100));%log-likelihood statistic
           %w=w+min(ss(i,j),h(i,1));%histogram intersection
           w=w+(((ss(i,j)-lbp_face(i,1)).^2)./(ss(i,j)+lbp_face(i,1)+(1e-10)));%chi aquare statistic
    end
    w=sqrt(w);
    L(j)=w;
    end
[value,idx]=sort(L,'ascend');
sort_labels=ref_labels(idx);
sort_label1=ref_label(idx);
% set(sort_label,'String',sort_label1);
 sort_label=cell2mat(sort_labels(1));
% sort_label=sort_label1{1};
if (sort_label1(1)<43)
str=['.\fb_face\' sort_label 'fb010_930831.jpg'];
end
if (sort_label1(1)>=43)&(sort_label1(1)<81)
str=['.\fb_face\' sort_label 'fb001d_931230.jpg'];
end
if (sort_label1(1)>=81)
       str=['.\fb_face\' sort_label 'fb011d_931230.jpg']; 
end
%str=imread('.\fb_face\sort_labelfb010_930831.jpg');

axes(handles.axes3);
imshow(str);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
