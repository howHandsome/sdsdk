 file_path_cat='C:\Users\liunian\Desktop\image\cat\';
 img_path_list_cat=dir(strcat(file_path_cat,'*.jpg'));
img_num_cat=length(img_path_list_cat);
y=[];
x=[];b=[0 255 170];
for i=1:7
    answ=2^i+(i-1);
    b=[b answ];
end
for i=2:7
    for j=1:(i-1)
        answ=2^i+2^j+(i-2);
        b=[b answ];
    end
end
for k=1:img_num_cat
   
    
    image_name_cat=img_path_list_cat(k).name;
    image_cat=imread(strcat(file_path_cat,image_name_cat));
    image_cat=imresize(image_cat,[128,128]);
    if numel(size(image_cat))>2
        image_cat=rgb2gray(image_cat);
    end
feacat=LBP(image_cat,b);
feacat=double(feacat/255);
if k==1
    m=size(feacat,1);
n=size(feacat,2);
w=zeros([1,(m*n)]);
end
a=m*n;

feacat=reshape(feacat,a,1);

if image_name_cat(1,1:3)=='dog'
                         y=[y 0];
                     else
                         y=[y 1];
                     end
                     
x=[x feacat];
end
w=learn(x,y,w);
file_path2='C:\Users\liunian\Desktop\image\test\';
img_path_list2=dir(strcat(file_path2,'*.jpg'));
img_num2=length(img_path_list2);
for k=1:img_num2
    image_name2=img_path_list2(k).name;
    image_test=imread(strcat(file_path2,image_name2));
    if numel(size(image_test))>2
    image_test=rgb2gray(image_test);
    end
    image_test=imresize(image_test,[128,128]);
    
feacat=LBP(image_test,b);
feacat=double(feacat/255);
if h(feacat,w)>0.5
    fprintf('这是一只猫 ');
else
    fprintf('这是一条狗 ');
end
end
     