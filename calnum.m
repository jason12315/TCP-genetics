function [ration,num]=calnum(list,space)   %listΪ����ĳ���ߺ�������ɵ�n*4����,space��ʾ���Ӵ�С1*4
    spacelist=space;
    cnt=1;
    while(isempty(list)~=1)
        object=list(1,:);                                  %ѡ���һ������
        flag=0;
            while(1)
                sortrows(spacelist,4);
                sz=size(spacelist);
                depth=sz(1);
                for s = 1 : depth                        %�ҵ�����װ��Ŀռ䲢�滻
                    if spacelist(s,1)>=object(1)&&spacelist(s,2)>=object(2)&&spacelist(s,3)>=object(3)   %��װ��
                        newspace=[];
                        a=spacelist(s,1)-object(1);      %��ʣ��ռ�����newspace
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
                        spacelist(s,:)=[];               %ɾ��װ�غ�Ŀռ�
                        spacelist=[spacelist;newspace];  %��newspace�������пռ��б��н����滻
                        flag=1;                          %�ҵ���
                        break;
                    end
                end
                if(~flag)                                %û�ҵ������ݣ��������Ǹ�����
                        spacelist=[spacelist;space];
                        cnt=cnt+1;
                else                                     %�ҵ�������ѭ��������һ������
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