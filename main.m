size=30;                                %种群大小
placenum=20;
epoches=300;
plot=rand(2,placenum);
VariationRate=0.10;
family=[];                              %所有个体记录访问顺序
BestIndividual=zeros(1,placenum);       %记录最优个体
for i=1:size                            %产生一个随机群落
    family=[family;randperm(placenum)];
end

for epoch= 1:epoches                   
    %开始迭代
    CalculateResult=[];
    %分别计算环境拟合值
    for i=1:length(family)                        
        CalculateResult=[CalculateResult;[i,distance(plot,family(i,:))]] ;
    end
    %留下拟合值低（距离短的个体）                                     ）
    CalculateResult=sortrows(CalculateResult,2);                         
    CalculateResult=CalculateResult(1:size,1); 
    if(BestIndividual==family(CalculateResult(1),:))   %未发生改变做退火处理
        family(CalculateResult(1),:)=SAA(family(CalculateResult(1),:),plot,epoch,epoches);
    end
    BestIndividual=family(CalculateResult(1),:);
    drawplot(plot,BestIndividual);             %一次作图
    
    
    
    %选择过程  %打乱种群
    newfamily=[];
    for i =randperm(size)
        newfamily=[newfamily;family(CalculateResult(i),:)];
    end
    family=newfamily;
    %繁衍过程
    %交叉
    newborn=[];
    for i=1:length(family)-1
        newborn=[newborn;crossover(family(i,:),family(i+1,:),0.5)];
    end
    %变异
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
    
    
