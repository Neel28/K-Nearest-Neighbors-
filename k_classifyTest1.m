function [class,accuracy] = k_classifyTest1(Train_data,Train_normData,data_Test,normData_Test,k,t)
%data_Train(1:5,:)
%normData_Train(1:5,:)

class = zeros(size(normData_Test,1),1);

for i = 1:size(normData_Test,1)
    if t==0
        euc = zeros(size(Train_data,1),3);
        data_Train = Train_data;
        normData_Train = Train_normData;
    else
        euc = zeros(size(Train_data,1)-1,3);
        if i==1
           data_Train = [Train_data(2:size(Train_data,1),:)];
           normData_Train = [Train_normData(2:size(Train_normData,1),:)];
        elseif i==size(Train_data,1)
           data_Train = [Train_data(1:(size(Train_data,1)-1),:)];
           normData_Train = [Train_normData(1:(size(Train_normData,1)-1),:)];
        else
           data_Train = [Train_data(1:(i-1),:);Train_data((i+1):size(Train_data,1),:)];
           normData_Train = [Train_normData(1:(i-1),:);Train_normData((i+1):size(Train_normData,1),:)];
        end
    end
    for j = 1:size(normData_Train,1)
        val = 0;
        for f = 1:21
            val = val + (normData_Test(i,f)-normData_Train(j,f))^2;
        end
        euc(j,1) = sqrt(val);
        euc(j,2) = data_Train(j,22);
        euc(j,3) = j;
    end
    
    euc = sortrows(euc,1);
    
    if k==1 || k==2
        class(i,1) = euc(1,2); 
    elseif k>2
        temp = zeros(4,2);
        temp(1,1)=1;
        temp(2,1)=2;
        temp(3,1)=3;
        temp(4,1)=4;
        
        for x=1:k
            temp(euc(x,2),2) = temp(euc(x,2),2)+1; 
        end
        temp = sortrows(temp,-2);
        if temp(1,2)>temp(2,2)
            class(i,1) = temp(1,1);
        elseif (temp(1,2)==temp(2,2)) && temp(1,2)>temp(3,2)
            for x=1:k
                if euc(x,2)==temp(1,1)
                    class(i,1) = temp(1,1);
                elseif euc(x,2)==temp(2,1)
                    class(i,1) = temp(2,1);
                end
            end
        elseif (temp(1,2)==temp(2,2)) && (temp(1,2)==temp(3,2)) && (temp(1,2)>temp(4,2))
            for x=1:k
                if euc(x,2)==temp(1,1)
                    class(i,1) = temp(1,1);
                elseif euc(x,2)==temp(2,1)
                    class(i,1) = temp(2,1);
                elseif euc(x,2)==temp(3,1)
                    class(i,1) = temp(3,1);
                end
            end
        elseif (temp(1,2)==temp(2,2)) && (temp(1,2)==temp(3,2)) && (temp(1,2)==temp(4,2))
            for x=1:k
                if euc(x,2)==temp(1,1)
                    class(i,1) = temp(1,1);
                elseif euc(x,2)==temp(2,1)
                    class(i,1) = temp(2,1);
                elseif euc(x,2)==temp(3,1)
                    class(i,1) = temp(3,1);
                elseif euc(x,2)==temp(4,1)
                    class(i,1) = temp(4,1);
                end
            end
        end
    end
end
    

num=0;
accuracy = 0;
for row = 1:size(class,1)
    if class(row,1)==data_Test(row,22)
        accuracy = accuracy+1;
        num=num+1;
    end
end
accuracy = (accuracy*100)/size(class,1); 
end



