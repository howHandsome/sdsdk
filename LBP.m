function fealbp=LBP(image,b)
cell=mat2cell(image,ones(size(image,1)/16,1)*16,ones(size(image,2)/16,1)*16);
fealbp=[];
for i=1:8
    for j=1:8
        for k=1:16
            for l=1:16
                if k==1||l==1
                    a(1)=0;
                else
                    a(1)=compare(cell{i,j}(k-1,l-1),cell{i,j}(k,l));
                end
                if k==1
                    a(2)=0;
                else
                    a(2)=compare(cell{i,j}(k-1,l),cell{i,j}(k,l));
                end
                if k==1||l==16
                    a(3)=0;
                else
                    a(3)=compare(cell{i,j}(k-1,l+1),cell{i,j}(k,l));
                end
                if l==16
                    a(4)=0;
                else
                    a(4)=compare(cell{i,j}(k,l+1),cell{i,j}(k,l));
                end
                if k==16||l==16
                    a(5)=0;
                else
                    a(5)=compare(cell{i,j}(k+1,l+1),cell{i,j}(k,l));
                end
                if k==16
                    a(6)=0;
                else
                    a(6)=compare(cell{i,j}(k+1,l),cell{i,j}(k,l));
                end
                if l==1||k==16
                    a(7)=0;
                else
                    a(7)=compare(cell{i,j}(k+1,l-1),cell{i,j}(k,l));
                end
                if l==1
                    a(8)=0;
                else
                    a(8)=compare(cell{i,j}(k,l-1),cell{i,j}(k,l));
                end
                c(k,l)=0;
                al=0;
                for m=2:8
                    if a(m)~=a(m-1)
                        al=al+1;
                    end
                end
                if al<=2
                    for m=1:8
                        c(k,l)=c(k,l)+a(m)*2^(8-m);
                    end
                else
                    c(k,l)=170;
                end
            end
        end
            for m=1:size(b,2)
                d(m)=length(find(cell{i,j}(:)==b(m)));
            end
        
        
        fealbp=[fealbp d];
    end
   
end

fealbp=fealbp';
end