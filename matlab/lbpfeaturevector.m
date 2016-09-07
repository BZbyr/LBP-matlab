%对应3*3模板特征值形成特征向量
function [m,f]=lbpfeaturevector(mat,s,n)
[~,~,d]=size(mat);
if d==3
    mat=rgb2gray(mat);
end
mat=double(mat);
mat=imresize(mat,[100 100],'bicubic');%归一化

k=calculatelbp(mat);
f=mat2gray(k);
%imshow(f);
k=uint8(k);
m=[];
for i=1:n:s
    for j=1:n:s
        A=k(i:(i+19),j:(j+19));
        h=[];
        h=imhist(A);
        m=[m;h/(n*n)];
    end
end