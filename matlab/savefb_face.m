%计算出训练库中所有检测出的人脸的LBP特征值
% function [k]=savefb_face(mat)
srcfolder='.\fb_face';
imglist=dir([srcfolder,'\*.jpg']);
imgsize=[100 100];
patchsize=[20 20];
file_number=size(imglist,1);
label=cell(file_number,1);
img=[];
number_label=[];
LBP_face=[];
for i=1:file_number
    imgname=imglist(i).name;
    label{i,1}=imgname(1:5);
    number_label=[number_label; str2num(imgname(1:5))];
    I=imread([srcfolder,'\',imgname]);
%     [h,width,d]=size(I);
%     if(d==3)
%         I=rgb2gray(I);
%     end
%     I=double(I);
%     I=imresize(I,imgsize);
    %img=[img I(:)];  
    I1=lbpfeaturevector2(I,100,20);
    LBP_face=[LBP_face I1];
end
% k=mat;
%lbp_fea=lbp_image_set2(img,imgsize,patchsize);
save ('fb_lbp_face.mat','LBP_face', 'label', 'number_label');




