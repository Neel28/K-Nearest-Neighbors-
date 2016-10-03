function [data,normData] = catToNum1(train)

data = zeros(size(train,1),22);

for i = 1:size(data,1)
    if strcmp(train(i,1),'vhigh')
        data(i,1) = 1;
    elseif strcmp(train(i,1),'high')
        data(i,2) = 1;
    elseif strcmp(train(i,1),'med')
        data(i,3) = 1;
    elseif strcmp(train(i,1),'low')
        data(i,4) = 1;
    end
    
    if strcmp(train(i,2),'vhigh')
        data(i,5) = 1;
    elseif strcmp(train(i,2),'high')
        data(i,6) = 1;
    elseif strcmp(train(i,2),'med')
        data(i,7) = 1;
    elseif strcmp(train(i,2),'low')
        data(i,8) = 1;
    end
    
    if strcmp(train(i,3),'2')
        data(i,9) = 1;
    elseif strcmp(train(i,3),'3')
        data(i,10) = 1;
    elseif strcmp(train(i,3),'4')
        data(i,11) = 1;
    elseif strcmp(train(i,3),'5more')
        data(i,12) = 1;
    end
    
    if strcmp(train(i,4),'2')
        data(i,13) = 1;
    elseif strcmp(train(i,4),'4')
        data(i,14) = 1;
    elseif strcmp(train(i,4),'more')
        data(i,15) = 1;
    end
    
    if strcmp(train(i,5),'small')
        data(i,16) = 1;
    elseif strcmp(train(i,5),'med')
        data(i,17) = 1;
    elseif strcmp(train(i,5),'big')
        data(i,18) = 1;
    end
    
    if strcmp(train(i,6),'low')
        data(i,19) = 1;
    elseif strcmp(train(i,6),'med')
        data(i,20) = 1;
    elseif strcmp(train(i,6),'high')
        data(i,21) = 1;
    end
    
    if strcmp(train(i,7),'unacc')
        data(i,22) = 1;
    elseif strcmp(train(i,7),'acc')
        data(i,22) = 2;
    elseif strcmp(train(i,7),'good')
        data(i,22) = 3;
    elseif strcmp(train(i,7),'vgood')
        data(i,22) = 4;
    end
    
end

normData = size(data);

meanData = mean(data(:,1:21))
stdData = std(data(:,1:21))
for i = 1:size(data,1)
    for j = 1:21
        if stdData(j)==0
            normData(i,j) = 0;
        else
            normData(i,j) = (data(i,j)-meanData(j))/stdData(j);
        end
    end
end

for row=1:size(data,1)
    normData(row,22) = data(row,22);
end
end
