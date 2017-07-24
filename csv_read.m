%clear all;clc;n
delimiterIn= ' ';
headerlinesIn = 0;
filename = 'D:\coat0531\sample5_50nm.txt';
%A=importdata(filename,delimiterIn,headerlinesIn);
A=importdata(filename);
X=A(:,1);
Y=A(:,2);

plot(Y)


%% multifile
% row_start=2;col_start=0;
% X=[];Y=[];
% row_end=4;col_end=1;
% range=[row_start col_start row_end col_end];
% A=csvread('s_0.csv',row_start,col_start,range); %0,0ÊÇÆðµã
% for i=1:6
%     filename=['b3_' num2str(i) '.csv'];
%     A=csvread(filename,row_start,col_start);
%     X=[X A(:,1)];Y=[Y A(:,2)];
% end
% 
% figure;
% s=size(X);col=s(2);
% p=ceil(col/4);
% for i=1:col
%     subplot(4,p,i);plot(X(:,i),Y(:,i));
%     title(['number:' num2str(i)])
% end



% %single file
% filename='pic1542.9368nm.csv';
% row_start=2;col_start=0;
% %row_end=994;col_end=1;
% %range=[row_start col_start row_end col_end];
% %A=csvread(filename,row_start,col_start,range);
% A=csvread(filename,row_start,col_start);
% x=A(:,1);Y=A(:,2);
% y=1-Y/max(Y);
% figure;plot(x,Y);hold on;
% %%MinPeakDistance MinPeakHeight Threshold
% [pks,loc,wid,pro]=findpeaks(y,x,'MinPeakProminence',0.04);
% plot(loc,pks,'ro');
% loc(find(wid==min(wid)))
% min(wid)