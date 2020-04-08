size=30;                                %��Ⱥ��С
placenum=20;
epoches=300;
plot=rand(2,placenum);
VariationRate=0.10;
family=[];                              %���и����¼����˳��
BestIndividual=zeros(1,placenum);       %��¼���Ÿ���
for i=1:size                            %����һ�����Ⱥ��
    family=[family;randperm(placenum)];
end

for epoch= 1:epoches                   
    %��ʼ����
    CalculateResult=[];
    %�ֱ���㻷�����ֵ
    for i=1:length(family)                        
        CalculateResult=[CalculateResult;[i,distance(plot,family(i,:))]] ;
    end
    %�������ֵ�ͣ�����̵ĸ��壩                                     ��
    CalculateResult=sortrows(CalculateResult,2);                         
    CalculateResult=CalculateResult(1:size,1); 
    if(BestIndividual==family(CalculateResult(1),:))   %δ�����ı����˻���
        family(CalculateResult(1),:)=SAA(family(CalculateResult(1),:),plot,epoch,epoches);
    end
    BestIndividual=family(CalculateResult(1),:);
    drawplot(plot,BestIndividual);             %һ����ͼ
    
    
    
    %ѡ�����  %������Ⱥ
    newfamily=[];
    for i =randperm(size)
        newfamily=[newfamily;family(CalculateResult(i),:)];
    end
    family=newfamily;
    %���ܹ���
    %����
    newborn=[];
    for i=1:length(family)-1
        newborn=[newborn;crossover(family(i,:),family(i+1,:),0.5)];
    end
    %����
    for i=1:length(newborn)
        if rand()<VariationRate
            for j= randi(placenum)
                x=randi(placenum);
                y=randi(placenum);
                t=newborn(i,x);
                newborn(i,x)=newborn(i,y);
                newborn(i,y)=t;
            end
        end
    end
    family=[family;newborn];
    pause(0.1);
end
disp("done!");
    
    
