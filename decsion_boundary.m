function decision_boundary()

load hw1boundary.mat

data1 = zeros(10201,2);
i=1;
for a=0:0.01:1
    for b=0:0.01:1
        data1(i,:) = [a,b];
        i = i+1;
    end
end
data = data1(1:10000,:);
size(data)
meanData = mean(data);
stdData = std(data);

normData_grid = size(data);

for row=1:size(data,1)
    for col=1:size(data,2)
        normData_grid(row,col) = (data(row,col)-meanData(col))/stdData(col);
    end
end

size(features)

m = mean(features);
s = std(features);

normData_f = size(features);

k=[1,5,15,25];

for pl=1:4
    for row=1:size(features,1)
        for col=1:size(features,2)
            normData_f(row,col) = (features(row,col)-m(col))/s(col);
        end
    end

    [class_1] = k_classifyDB(normData_f,labels,normData_grid,15);

    for row = 1:size(class_1,1)
        if class_1(row,1)==1
            scatter(data(row,1),data(row,2),'filled','r');
            hold on
        else
            scatter(data(row,1),data(row,2),'filled','b');
            hold on
        end
        ylim([0 1]);
        xlim([0 1]);
    end
end

end












