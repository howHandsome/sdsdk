 file_path_cat='C:\Users\liunian\Desktop\image\cat\'; 
 img_path_list_cat=dir(strcat(file_path_cat,'*.jpg'));
 img_num_cat=length(img_path_list_cat);
 y=[]; x=[]; 
 for k=1:img_num_cat 
     image_name_cat=img_path_list_cat(k).name;
     image_cat=imread(strcat(file_path_cat,image_name_cat));
     if numel(size(image_cat))>2 
         image_cat=rgb2gray(image_cat);
     end 
     image_cat=imresize(image_cat,[100 100]); 
     image_cat=double(image_cat);

image_cat=double(image_cat/255);
l_cat = size(image_cat,2);
img_aver_cat = mean(image_cat,2); 
for i = 1:l_cat 
    image_cat(:,i) = (image_cat(:,i) - img_aver_cat);
end
covmat = cov(image_cat); 
[coeff,latent,explained] = pcacov(covmat);

if k==1 
    i = 1; 
    proportion = 0;
    while(proportion < 98) 
        proportion = proportion + explained(i);
        i = i+1;
    end
    p = i-1; 
end
feature=image_cat*coeff;
feature=feature(:,40:p+40); 
feacat=feature'*image_cat;
if k==1 m=size(feacat,1);
    n=size(feacat,2);
    w=zeros([1,(m*n)]);
end
a=m*n;

feacat=reshape(feacat,a,1); 
feacat=premnmx(feacat); 
if image_name_cat(1,1:3)=='dog'
    y=[y 0]; 
else
    y=[y 1]; 
end

x=[x feacat]; 
 end
 w=learn(x,y,w);
 file_path2='C:\Users\liunian\Desktop\image\test\'; 
 img_path_list2=dir(strcat(file_path2,'.jpg'));
 img_num2=length(img_path_list2); 
 for k=1:img_num2 
     image_name2=img_path_list2(k).name; 
     image_test=imread(strcat(file_path2,image_name2)); 
     if numel(size(image_test))>2 
         image_test=rgb2gray(image_test); 
     end
     image_test=imresize(image_test,[100,100]); 
     image_test=double(image_test);
     image_test = double(image_test/255);
     l_test = size(image_test,2); 
     img_aver_test = mean(image_test,2); 
     for i = 1:l_test 
         image_test(:,i) = image_test(:,i) - img_aver_test; 
     end
     covmat = cov(image_test); 
     [coeff,latent,explained] = pcacov(covmat);
     feature=image_test*coeff;
     feature=feature(:,40:p+40); 
     feacat=feature'*image_test;

feacat=reshape(feacat,a,1); 

if h(feacat,w)>0.5 
    fprintf('这是一只猫 ');
else
    fprintf('这是一条狗 '); 
end
end
    