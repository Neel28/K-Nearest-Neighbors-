function [class] = k_classifyDB(normData_f,labels,normData_grid,k)
%data_Train(1:5,:)
%normData_Train(1:5,:)

class = zeros(size(normData_grid,1),1);

for i = 1:size(normData_grid,1)
        euc = zeros(size(normData_f,1),3);
    for j = 1:size(normData_f,1)
        val = 0;
        for f = 1:2
            val = val + (normData_f(j,f)-normData_grid(i,f))^2;
        end
        euc(j,1) = sqrt(val);
        euc(j,2) = labels(j,1);
        euc(j,3) = j;
    end
    
    euc = sortrows(euc,1);
    if k==1 || k==2
        class(i,1) = euc(1,2); 
    elseif k>2
        temp = zeros(2,2);
        temp(1,1)=1;
        temp(2,1)=-1;
    
        for x=1:k
            if euc(x,2)==1
                temp(1,2) = temp(1,2)+1;
            else 
                temp(2,2) = temp(2,2)+1;
            end
        end
        temp = sortrows(temp,-2);
        if temp(1,2)>temp(2,2)
            class(i,1) = temp(1,1);
        else 
            class(i,1) = euc(1,2);
        end
    end
end
       
end



