function [class] = k_classifyTest2(Train_data,Train_normData,data_Test,normData_Test,t)
k=[1,3,5,7,9,11,13,15];
class = zeros(size(normData_Test,1),size(k,2));

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
        for f = 1:6
            val = val + (normData_Test(i,f)-normData_Train(j,f))^2;
        end
        euc(j,1) = sqrt(val);
        euc(j,2) = data_Train(j,7);
        euc(j,3) = j;
    end
    euc = sortrows(euc,1);
    
    %iterating all values of K to predict class for ith row of test
    for kp=1:size(k,2)
        if k(1,kp)==1 || k(1,kp)==2
            class(i,kp) = euc(1,2);
        else
            temp = zeros(4,2);
            temp(1,1)=1;
            temp(2,1)=2;
            temp(3,1)=3;
            temp(4,1)=4;
            
            for x=1:k(1,kp)
                temp(euc(x,2),2) = temp(euc(x,2),2)+1; 
            end
            temp = sortrows(temp,-2);
            
            if temp(1,2)>temp(2,2)
                class(i,kp) = temp(1,1);
            elseif (temp(1,2)==temp(2,2)) && temp(1,2)>temp(3,2)
                for x=1:k(1,kp)
                    if euc(x,2)==temp(1,1)
                        class(i,kp) = temp(1,1);
                    elseif euc(x,2)==temp(2,1)
                        class(i,kp) = temp(2,1);
                    end
                end
            elseif (temp(1,2)==temp(2,2)) && (temp(1,2)==temp(3,2)) && (temp(1,2)>temp(4,2))
                for x=1:k(1,kp)
                    if euc(x,2)==temp(1,1)
                        class(i,kp) = temp(1,1);
                    elseif euc(x,2)==temp(2,1)
                        class(i,kp) = temp(2,1);
                    elseif euc(x,2)==temp(3,1)
                        class(i,kp) = temp(3,1);
                    end
                end
            elseif (temp(1,2)==temp(2,2)) && (temp(1,2)==temp(3,2)) && (temp(1,2)==temp(4,2))
                for x=1:k(1,kp)
                    if euc(x,2)==temp(1,1)
                        class(i,kp) = temp(1,1);
                    elseif euc(x,2)==temp(2,1)
                        class(i,kp) = temp(2,1);
                    elseif euc(x,2)==temp(3,1)
                        class(i,kp) = temp(3,1);
                    elseif euc(x,2)==temp(4,1)
                        class(i,kp) = temp(4,1);
                    end
                end
            end
        end
    end   
end

end







