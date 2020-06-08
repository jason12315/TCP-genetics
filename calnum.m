function [ration,num]=calnum(list,space)   %list为物体的长宽高和体积构成的n*4矩阵,space表示箱子大小1*4
    spacelist=space;
    cnt=1;
    while(isempty(list)~=1)
        object=list(1,:);                                  %选择第一个物体
        flag=0;
            while(1)
                sortrows(spacelist,4);
                sz=size(spacelist);
                depth=sz(1);
                for s = 1 : depth                        %找到可以装入的空间并替换
                    if spacelist(s,1)>=object(1)&&spacelist(s,2)>=object(2)&&spacelist(s,3)>=object(3)   %可装载
                        newspace=[];
                        a=spacelist(s,1)-object(1);      %将剩余空间生成newspace
                        b=spacelist(s,2);
                        c=spacelist(s,3);
                        if(a&&b&&c)
                            newspace=[a,b,c,a*b*c];
                        end
                        a=object(1);
                        b=spacelist(s,2);
                        c=spacelist(s,3)-object(3);
                        if(a&&b&&c)
                            newspace=[newspace;a,b,c,a*b*c];
                        end
                        a=object(1);
                        b=spacelist(s,2)-object(2);
                        c=object(3);
                        if(a&&b&&c)
                            newspace=[newspace;a,b,c,a*b*c];
                        end
                        spacelist(s,:)=[];               %删除装载后的空间
                        spacelist=[spacelist;newspace];  %将newspace加入所有空间列标中进行替换
                        flag=1;                          %找到了
                        break;
                    end
                end
                if(~flag)                                %没找到则扩容，继续考虑该物体
                        spacelist=[spacelist;space];
                        cnt=cnt+1;
                else                                     %找到后跳出循环考虑下一个物体
                    list(1,:)=[];
                    break;
                end
            end
    end
    num=cnt;
    S=sum(spacelist);
    total=S(1,4);
    ration=1-total/(cnt*space(1,4));
end